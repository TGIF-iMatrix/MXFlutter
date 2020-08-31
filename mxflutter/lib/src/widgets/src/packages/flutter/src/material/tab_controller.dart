//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/material/tab_controller.dart';
import 'dart:math' as math;
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/constants.dart';
// MX Modified begin
import 'package:mxflutter/src/mx_mixin.dart';
// MX Modified end

///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerTabControllerSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_tabController.funName] = _tabController;
  m[_defaultTabController.funName] = _defaultTabController;
  return m;
}

// MX Modified begin
var _tabController = MXFunctionInvoke(
  "TabController",
  ({
    int initialIndex = 0,
    int length,
    TickerProvider vsync,
    dynamic listenerList,
    dynamic mirrorID,
  }) {
    TabController tabController = TabController(
      initialIndex: initialIndex,
      length: length,
      // MX modified begin
      vsync: _tabController.buildOwner.state as MXTickerMixinWidgetState
      // MX modified end
    );
    if (listenerList != null) {
      tabController.addListener(_createListenerHandle(_tabController.buildOwner, mirrorID, "listenerCallback", tabController));
    }
    return tabController;
  },
  [
    "initialIndex",
    "length",
    "vsync",
    "listenerList",
    "mirrorID",
  ],
);

VoidCallback _createListenerHandle(
    dynamic bo, String mirrorID, String functionName, TabController tabController) {
  VoidCallback cb = () {
    Map args = {
      "index": tabController.index,
      "previousIndex": tabController.previousIndex,
      "indexIsChanging": tabController.indexIsChanging,
      "offset": tabController.offset,
    };
    bo.mirrorObjEventCallback(mirrorID: mirrorID, functionName: functionName, p: args);
  };
  return cb;
}
// MX Modified end

var _defaultTabController = MXFunctionInvoke(
  "DefaultTabController",
  ({
    Key key,
    int length,
    int initialIndex = 0,
    Widget child,
  }) =>
      DefaultTabController(
    key: key,
    length: length,
    initialIndex: initialIndex,
    child: child,
  ),
  [
    "key",
    "length",
    "initialIndex",
    "child",
  ],
);
