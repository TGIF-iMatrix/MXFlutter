//
//  MXJSEngine.h
//  MXFlutterOCFramework
//
//  Created by soapyang on 2018/12/22.
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

#import <Foundation/Foundation.h>
#import "MXJSExecutor.h"
#import <Flutter/Flutter.h>


@class MXJSFlutterEngine;
@class MXDispose;

NS_ASSUME_NONNULL_BEGIN

/*
 *MXJSEngine
 *负责Native/JS 二方衔接
 *导出Native业务接口
 */
@interface MXJSEngine : NSObject <MXFDispose>


@property (nonatomic, weak) MXJSFlutterEngine *jsFlutterEngine;

@property (nonatomic, strong) MXJSExecutor *jsExecutor;

@property (nonatomic, strong, readonly) NSMutableDictionary *jsCallbackCache;

- (instancetype)init;

- (void)addSearchDir:(NSString*)dir;

- (void)callJSCallbackFunction:(NSString *)callbackId param:(id)param;

- (void)callJSCallbackFunctionWithChannelName:(NSString *)channelName
                                   methodCall:(FlutterMethodCall *)methodCall
                                     callback:(void(^)(id _Nullable result))callback;

- (NSString *)calcRequireJSAbsolutePath:(NSString *)filePath;

- (NSString *)storeJsCallback:(JSValue *)function;

@end

NS_ASSUME_NONNULL_END
