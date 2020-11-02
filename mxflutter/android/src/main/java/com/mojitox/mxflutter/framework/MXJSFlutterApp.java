//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

package com.mojitox.mxflutter.framework;

import static com.mojitox.mxflutter.MXFlutterPlugin.JSFLUTTER_LOCAL_DIR;
import static com.mojitox.mxflutter.MXFlutterPlugin.MXFLUTTER_ASSET_APP_ROOT_PATH;
import static com.mojitox.mxflutter.MXFlutterPlugin.MXFLUTTER_ASSET_FRAMWORK_ROOT_PATH;
import static com.mojitox.mxflutter.MXFlutterPlugin.MXFLUTTER_FS_APP_ROOT_PATH;
import static com.mojitox.mxflutter.MXFlutterPlugin.MXFLUTTER_FS_FRAMWORK_ROOT_PATH;

import android.content.Context;
import android.util.Log;
import androidx.annotation.Keep;
import com.eclipsesource.v8.V8Array;
import com.eclipsesource.v8.V8Object;
import com.eclipsesource.v8.V8ScriptExecutionException;
import com.eclipsesource.v8.utils.V8ObjectUtils;
import com.mojitox.mxflutter.MXFlutterPlugin;
import com.mojitox.mxflutter.framework.utils.FileUtils;
import com.mojitox.mxflutter.framework.utils.LogUtilsKt;
import com.mojitox.mxflutter.framework.utils.MXJsScheduledExecutorService;
import com.mojitox.mxflutter.framework.utils.UiThreadUtil;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StringCodec;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class MXJSFlutterApp {

    public static final String TAG = "MXJSFlutterApp";

    static MXJSFlutterEngine jsFlutterEngineStatic;

    private MXFlutterPlugin mContext;

    private String appName;
    private String rootPath;
    private List<String> jsAppSearchPathList;
    private MXJSFlutterEngine jsFlutterEngine;

    private MXJSEngine jsEngine;
    private MXJSExecutor jsExecutor;

    private boolean isJSAPPRun;
    private MXJSFlutterApp currentApp;
    private V8Object jsAppObj;

    //mx框架flutter侧初始化耗时
    public long mxFlutterInitCost;
    //mx框架native侧加载main.js耗时
    private long mxNativeJSLoadCost;

    //Flutter通道
    private static final String MXFLUTTER_METHED_CHANNEL_APP = "js_flutter.js_flutter_app_channel";
    private static final String MXFLUTTER_METHED_CHANNEL_APP_REBUILD = "js_flutter.js_flutter_app_channel.rebuild";
    private static final String MXFLUTTER_METHED_CHANNEL_APP_NAVIGATOR_PUSH = "js_flutter.js_flutter_app_channel.navigator_push";

    MethodChannel jsFlutterAppChannel;
    BasicMessageChannel<String> jsFlutterAppRebuildChannel;
    BasicMessageChannel<String> jsFlutterAppNavigatorePushChannel;

    private ArrayList<MethodCall> callJSMethodQueue;

    public MXJSFlutterApp initWithAppName(MXFlutterPlugin context, String appName, String rootPath,
                                          List<String> jsAppSearchPathList, MXJSFlutterEngine jsFlutterEngine,
                                          Map<String, Boolean> flutterAppEnvironmentInfo) {
        initRuntime(context.mFlutterPluginBinding.getApplicationContext());
        this.mContext = context;
        this.appName = appName;
        this.rootPath = rootPath;
        this.jsAppSearchPathList = jsAppSearchPathList;
        this.jsFlutterEngine = jsFlutterEngine;
        jsFlutterEngineStatic = jsFlutterEngine;
        isJSAPPRun = false;

        callJSMethodQueue = new ArrayList<>(1);

        setupJSEngine(jsFlutterEngine);
        setUpChannel(context.mFlutterPluginBinding.getBinaryMessenger());
        setFlutterAppEnvironmentInfo(flutterAppEnvironmentInfo);

        currentApp = this;
        System.loadLibrary("mxflutter");
        init(currentApp);
        return this;
    }

    private void initRuntime(Context context) {
        initJsFS(context);
    }

    //js文件转移到fs中
    private void initJsFS(Context context) {
        if (FileUtils.isNeedCopyFileFromAssets(context)) {
            new Thread() {
                @Override
                public void run() {
                    super.run();
                    FileUtils.copyFilesFromAssetsAsync(context,
                            Arrays.asList(new MXRoute[]{
                                    new MXRoute(MXFLUTTER_ASSET_APP_ROOT_PATH, JSFLUTTER_LOCAL_DIR + MXFLUTTER_FS_APP_ROOT_PATH),
                                    new MXRoute(MXFLUTTER_ASSET_FRAMWORK_ROOT_PATH, JSFLUTTER_LOCAL_DIR + MXFLUTTER_FS_FRAMWORK_ROOT_PATH)}));
                }
            }.start();
        }
    }

    private void setupJSEngine(MXJSFlutterEngine jsFlutterEngine) {

        jsEngine = new MXJSEngine(mContext, jsFlutterEngine);
        jsFlutterEngine.setJsEngine(jsEngine);

        jsExecutor = jsEngine.jsExecutor;

        //JSFlutter JS运行库搜索路径
        jsEngine.addSearchDir(jsFlutterEngine.mJsFrameworkPath);
        jsEngine.addSearchDir(jsFlutterEngine.mJsFrameworkPath + "/framework");
        //JSFlutter Dart JS运行库搜索路径
        jsEngine.addSearchDir(jsFlutterEngine.mJsFrameworkPath + "/framework/dart_js_framework");

        //app业务代码搜索路径
        jsEngine.addSearchDir(rootPath);

        for (String appSearchPath : jsAppSearchPathList) {
            jsEngine.addSearchDir(appSearchPath);
        }

//        String jsBasicLibPath = jsFlutterEngine.mJsFrameworkPath + "/framework/js_basic_lib.js";
//        jsExecutor.executeScriptPath(jsBasicLibPath, new MXJSExecutor.ExecuteScriptCallback() {
//            @Override
//            public void onComplete(Object value) {
//
//            }
//        });
    }

    private void setFlutterAppEnvironmentInfo(Map flutterAppEnvironmentInfo) {
        jsExecutor.registerGlobalObject("mx_flutterAppEnvironmentInfo", flutterAppEnvironmentInfo);
    }

    //flutter --> js
    void setUpChannel(BinaryMessenger flutterViewController) {
        jsFlutterAppChannel = new MethodChannel(flutterViewController, MXFLUTTER_METHED_CHANNEL_APP);
        jsFlutterAppChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (currentApp == null)
                    return;

                if (methodCall.method.equals("callJS")) {
                    LogUtilsKt.MXJSFlutterLog("MXJSFlutter : jsFlutterAppChannel callJS:%s", (String) ((Map) methodCall.arguments).get("method"));
                    if (!isJSAPPRun) {
                        LogUtilsKt.MXJSFlutterLog("MXJSFlutter : jsFlutterAppChannel callJS:%s JSAPP not running", (String) ((Map) methodCall.arguments).get("method"));
                        callJSMethodQueue.add(methodCall);
                        return;
                    }
                    currentApp.jsExecutor.execute(new MXJsScheduledExecutorService.MXJsTask() {
                        @Override
                        public void excute() {
                            if (jsAppObj == null) return;
                            currentApp.jsExecutor.invokeJSValue(jsAppObj, "nativeCall", (Map) methodCall.arguments, new MXJSExecutor.InvokeJSValueCallback() {
                                @Override
                                public void onSuccess(Object value) {
                                    result.success(value.toString());
                                }

                                @Override
                                public void onError(Error error) {
                                    result.error(error.toString(), null, null);
                                }
                            });
                        }
                    });
                }
            }
        });

        // Rebuild方法采用BasicMessageChannel
        jsFlutterAppRebuildChannel = new BasicMessageChannel<>(flutterViewController, MXFLUTTER_METHED_CHANNEL_APP_REBUILD, StringCodec.INSTANCE);
        // navigator_push方法采用BasicMessageChannel
        jsFlutterAppNavigatorePushChannel = new BasicMessageChannel<>(flutterViewController, MXFLUTTER_METHED_CHANNEL_APP_NAVIGATOR_PUSH, StringCodec.INSTANCE);
    }


    public void close() {
        this.jsExecutor.execute(new MXJsScheduledExecutorService.MXJsTask() {
            @Override
            public void excute() {
                //todo app release
                JSModule.clearModuleCache(MXJSExecutor.runtime);

                if (jsAppObj != null) {
                    jsAppObj.close();
                }
            }
        });
        this.jsExecutor.close();
        release();
        Log.d(TAG,"close:"+Log.getStackTraceString(new Throwable()));
    }

    public void runApp() {
        isJSAPPRun = false;
        runAppWithPageName();
    }

    public void runAppWithPageName() {
        LogUtilsKt.MXJSFlutterLog("MXJSFlutterApp : runApp：%s", appName);

        jsExecutor.execute(new MXJsScheduledExecutorService.MXJsTask() {
            @Override
            public void excute() {
                MXNativeJSFlutterApp MXNativeJSFlutterApp = new MXNativeJSFlutterApp();
                V8Object v8Object = new V8Object(MXJSExecutor.runtime);
                MXJSExecutor.runtime.add("MXNativeJSFlutterApp", v8Object);
                v8Object.registerJavaMethod(MXNativeJSFlutterApp, "setCurrentJSApp",
                        "setCurrentJSApp", new Class<?>[]{V8Object.class});
                v8Object.registerJavaMethod(MXNativeJSFlutterApp,
                        "callFlutterReloadApp", "callFlutterReloadApp", new Class<?>[]{V8Object.class, String.class});
                v8Object.registerJavaMethod(MXNativeJSFlutterApp,
                        "callFlutterWidgetChannel", "callFlutterWidgetChannel", new Class<?>[]{String.class, String.class});
            }
        });

        // 记录native侧main.js加载开始时间
        long jsLoadStartTime = System.currentTimeMillis();
        jsExecutor.executeScriptPath(rootPath + "/main.js", new MXJSExecutor.ExecuteScriptCallback() {
            @Override
            public void onComplete(Object value) {
                isJSAPPRun = true;
                callJSMethodCallQueqe();

                // 记录native侧main.js加载开始时间
                mxNativeJSLoadCost = System.currentTimeMillis() - jsLoadStartTime;
            }
        });
    }

    private void callJSMethodCallQueqe() {
        for (MethodCall call : callJSMethodQueue) {
            currentApp.jsExecutor.invokeJSValue(jsAppObj, "nativeCall", (Map) call.arguments, new MXJSExecutor.InvokeJSValueCallback() {
                @Override
                public void onSuccess(Object value) {

                }

                @Override
                public void onError(Error error) {

                }
            });
        }
        callJSMethodQueue.clear();
    }

    public void callJSInitProfileInfo() {
        Map<String, Object> args = new HashMap<>();
        args.put("method", "nativeCallInitProfileInfo");
        Map<String, Object> arguments = new HashMap<>();
        arguments.put("mxFlutterInitCost", mxFlutterInitCost);
        arguments.put("mxNativeJSLoadCost", mxNativeJSLoadCost);
        args.put("arguments", arguments);

        currentApp.jsExecutor.invokeJSValue(jsAppObj, "nativeCall", args, new MXJSExecutor.InvokeJSValueCallback() {
            @Override
            public void onSuccess(Object value) {

            }

            @Override
            public void onError(Error error) {

            }
        });
    }

    //js 注入对象
    class MXNativeJSFlutterApp {

        //js --> native
        public void setCurrentJSApp(V8Object jsApp) {
            jsAppObj = jsApp.twin();
        }

        //js --> flutter
        public void callFlutterReloadApp(V8Object jsApp, String widgetData) {
            jsAppObj = jsApp.twin();

            mContext.getMainHandler().post(new Runnable() {
                @Override
                public void run() {
                    jsFlutterEngine.callFlutterReloadAppWithJSWidgetData(widgetData);
                }
            });
        }

        //js --> flutter
        public void callFlutterWidgetChannel(String methodName, String args) {
//            String[] datas = args.getKeys();
//            HashMap dataMap =  new HashMap();
//            for (int i = 0; i < datas.length; i++) {
//                dataMap.put(datas[i],args.get(datas[i]));
//            }
            mContext.getMainHandler().post(new Runnable() {
                @Override
                public void run() {
                    if (methodName.equals("rebuild")) {
                        jsFlutterAppRebuildChannel.send(args);
                    } else if (methodName.equals("navigatorPush")) {
                        jsFlutterAppNavigatorePushChannel.send(args);
                    } else {
                        jsFlutterAppChannel.invokeMethod(methodName, args);
                    }
                }
            });
        }
    }

    public static class MXRoute {
        public String assetsPath;
        public String localPath;

        public MXRoute(String assetsPath, String localPath) {
            this.assetsPath = assetsPath;
            this.localPath = localPath;
        }
    }

    @Keep
    public String syncPropsCallback(String args) {
        if (jsAppObj != null) {
            final Object[] result = new Object[1];
            CountDownLatch countDownLatch = new CountDownLatch(1);
            UiThreadUtil.post(() -> {
                Map<String, Object> jsArgument = new HashMap<>();
                jsArgument.put("method", "syncPropsCallback");
                jsArgument.put("arguments", args);
                result[0] = jsAppObj.executeFunction("nativeCall", new V8Array(MXJSExecutor.runtime).push(
                        V8ObjectUtils.toV8Object(MXJSExecutor.runtime, jsArgument)));
                countDownLatch.countDown();
                Log.d("mxflutternative", "call js syncPropsCallback result:" + result[0]);
            });
            try {
                countDownLatch.await(3, TimeUnit.SECONDS);
            } catch (InterruptedException e) {
                e.printStackTrace();
                return "countDownLatch exception";
            } catch (V8ScriptExecutionException e){
                e.printStackTrace();
                return "V8ScriptExecutionException";
            }
            return result[0].toString();
        }
        Log.d("mxflutternative", "call java syncPropsCallback null:" + this);
        return "jsAppObj is null";
    }

    private native void init(MXJSFlutterApp currentApp);

    private native void release();
}
