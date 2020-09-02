//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/material/radio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/constants.dart';
import 'package:flutter/src/material/debug.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/material/toggleable.dart';

///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerRadioSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_radio.funName] = _radio;
  return m;
}

var _radio = MXFunctionInvoke(
  "Radio",
  ({
    Key key,
    dynamic value,
    dynamic groupValue,
    dynamic onChanged,
    Color activeColor,
    Color focusColor,
    Color hoverColor,
    MaterialTapTargetSize materialTapTargetSize,
    VisualDensity visualDensity,
    FocusNode focusNode,
    bool autofocus = false,
  }) =>
      Radio(
    key: key,
    value: value,
    groupValue: groupValue,
    onChanged:
        createValueChangedGenericClosure<dynamic>(_radio.buildOwner, onChanged),
    activeColor: activeColor,
    focusColor: focusColor,
    hoverColor: hoverColor,
    materialTapTargetSize: materialTapTargetSize,
    visualDensity: visualDensity,
    focusNode: focusNode,
    autofocus: autofocus,
  ),
  [
    "key",
    "value",
    "groupValue",
    "onChanged",
    "activeColor",
    "focusColor",
    "hoverColor",
    "materialTapTargetSize",
    "visualDensity",
    "focusNode",
    "autofocus",
  ],
);