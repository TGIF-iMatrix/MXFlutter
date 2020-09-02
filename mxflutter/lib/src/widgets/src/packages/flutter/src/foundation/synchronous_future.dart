//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/foundation/synchronous_future.dart';
import 'dart:async';

///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerSynchronousFutureSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_synchronousFuture.funName] = _synchronousFuture;
  return m;
}

var _synchronousFuture = MXFunctionInvoke(
  "SynchronousFuture",
  ({
    dynamic value,
  }) =>
      SynchronousFuture(
    value,
  ),
  [
    "value",
  ],
);