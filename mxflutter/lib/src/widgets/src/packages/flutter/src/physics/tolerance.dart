//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/physics/tolerance.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerToleranceSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_tolerance.funName] = _tolerance;
  return m;
}
var _tolerance = MXFunctionInvoke(
    "Tolerance",
    (
      {
      double distance = 0.001,
      double time = 0.001,
      double velocity = 0.001,
      }
    ) =>
      Tolerance(
      distance: distance?.toDouble(),
      time: time?.toDouble(),
      velocity: velocity?.toDouble(),
    ),
);
