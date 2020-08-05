//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/src/animation/animation.dart';
import 'package:flutter/src/animation/curves.dart';
import 'package:flutter/src/animation/listener_helpers.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerAnimationControllerSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_animationBehavior.funName] = _animationBehavior;
  m[_animationController.funName] = _animationController;
  m[_animationController_unbounded.funName] = _animationController_unbounded;
  return m;
}
var _animationBehavior = MXFunctionInvoke(
    "AnimationBehavior",
    ({Map args}) => MXAnimationBehavior.parse(args),
  );
var _animationController = MXFunctionInvoke(
    "AnimationController",
    (
      {
      double value,
      Duration duration,
      Duration reverseDuration,
      String debugLabel,
      double lowerBound = 0.0,
      double upperBound = 1.0,
      AnimationBehavior animationBehavior = AnimationBehavior.normal,
      TickerProvider vsync,
      }
    ) =>
      AnimationController(
      value: value?.toDouble(),
      duration: duration,
      reverseDuration: reverseDuration,
      debugLabel: debugLabel,
      lowerBound: lowerBound?.toDouble(),
      upperBound: upperBound?.toDouble(),
      animationBehavior: animationBehavior,
      vsync: vsync,
    ),
);
var _animationController_unbounded = MXFunctionInvoke(
  "animationController.unbounded",
    (
      {
      double value = 0.0,
      Duration duration,
      Duration reverseDuration,
      String debugLabel,
      TickerProvider vsync,
      AnimationBehavior animationBehavior = AnimationBehavior.preserve,
      }
    ) =>
      AnimationController.unbounded(
      value: value?.toDouble(),
      duration: duration,
      reverseDuration: reverseDuration,
      debugLabel: debugLabel,
      vsync: vsync,
      animationBehavior: animationBehavior,
    ),
);
class MXAnimationBehavior {
  static Map str2VMap = {
    'AnimationBehavior.normal': AnimationBehavior.normal,
    'AnimationBehavior.preserve': AnimationBehavior.preserve,
  };
  static AnimationBehavior parse(dynamic value) {
    if (value is Map) {
      var valueStr = value["_name"].trim();
      var v = str2VMap[valueStr];
      return v;
    } else {
      return value;
    }
  }
}
