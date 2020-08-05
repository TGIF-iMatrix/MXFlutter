//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'package:flutter/src/foundation/debug.dart';
import 'dart:async';
import 'package:flutter/src/foundation/assertions.dart';
import 'package:flutter/src/foundation/platform.dart';
import 'package:flutter/src/foundation/print.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'dart:math';
import 'package:meta/meta.dart';
import 'package:flutter/src/foundation/constants.dart';
import 'package:flutter/src/foundation/object.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/foundation/stack_frame.dart';


///把自己能处理的类注册到分发器中
Map<String, MXFunctionInvoke> registerDebugSeries() {
  var m = <String, MXFunctionInvoke>{};
  m[_diagnosticLevel.funName] = _diagnosticLevel;
  m[_diagnosticsTreeStyle.funName] = _diagnosticsTreeStyle;
  m[_textTreeConfiguration.funName] = _textTreeConfiguration;
  m[_textTreeRenderer.funName] = _textTreeRenderer;
  m[_diagnosticsProperty.funName] = _diagnosticsProperty;
  m[_diagnosticsProperty_lazy.funName] = _diagnosticsProperty_lazy;
  m[_messageProperty.funName] = _messageProperty;
  m[_stringProperty.funName] = _stringProperty;
  m[_doubleProperty.funName] = _doubleProperty;
  m[_doubleProperty_lazy.funName] = _doubleProperty_lazy;
  m[_intProperty.funName] = _intProperty;
  m[_percentProperty.funName] = _percentProperty;
  m[_flagProperty.funName] = _flagProperty;
  m[_iterableProperty.funName] = _iterableProperty;
  m[_enumProperty.funName] = _enumProperty;
  m[_objectFlagProperty.funName] = _objectFlagProperty;
  m[_objectFlagProperty_has.funName] = _objectFlagProperty_has;
  m[_flagsSummary.funName] = _flagsSummary;
  m[_diagnosticableNode.funName] = _diagnosticableNode;
  m[_diagnosticableTreeNode.funName] = _diagnosticableTreeNode;
  m[_diagnosticPropertiesBuilder.funName] = _diagnosticPropertiesBuilder;
  m[_diagnosticPropertiesBuilder_fromProperties.funName] = _diagnosticPropertiesBuilder_fromProperties;
  m[_diagnosticsBlock.funName] = _diagnosticsBlock;
  m[_partialStackFrame.funName] = _partialStackFrame;
  m[_repetitiveStackFrameFilter.funName] = _repetitiveStackFrameFilter;
  m[_errorDescription.funName] = _errorDescription;
  m[_errorSummary.funName] = _errorSummary;
  m[_errorHint.funName] = _errorHint;
  m[_errorSpacer.funName] = _errorSpacer;
  m[_flutterErrorDetails.funName] = _flutterErrorDetails;
  m[_flutterError.funName] = _flutterError;
  m[_flutterError_fromParts.funName] = _flutterError_fromParts;
  m[_diagnosticsStackTrace.funName] = _diagnosticsStackTrace;
  m[_diagnosticsStackTrace_singleFrame.funName] = _diagnosticsStackTrace_singleFrame;
  return m;
}
var _diagnosticLevel = MXFunctionInvoke(
    "DiagnosticLevel",
    ({Map args}) => MXDiagnosticLevel.parse(args),
  );
var _diagnosticsTreeStyle = MXFunctionInvoke(
    "DiagnosticsTreeStyle",
    ({Map args}) => MXDiagnosticsTreeStyle.parse(args),
  );
var _textTreeConfiguration = MXFunctionInvoke(
    "TextTreeConfiguration",
    (
      {
      String prefixLineOne,
      String prefixOtherLines,
      String prefixLastChildLineOne,
      String prefixOtherLinesRootNode,
      String linkCharacter,
      String propertyPrefixIfChildren,
      String propertyPrefixNoChildren,
      String lineBreak = '\n',
      bool lineBreakProperties = true,
      String afterName = ':',
      String afterDescriptionIfBody = '',
      String afterDescription = '',
      String beforeProperties = '',
      String afterProperties = '',
      String mandatoryAfterProperties = '',
      String propertySeparator = '',
      String bodyIndent = '',
      String footer = '',
      bool showChildren = true,
      bool addBlankLineIfNoChildren = true,
      bool isNameOnOwnLine = false,
      bool isBlankLineBetweenPropertiesAndChildren = true,
      String beforeName = '',
      String suffixLineOne = '',
      String mandatoryFooter = '',
      }
    ) =>
      TextTreeConfiguration(
      prefixLineOne: prefixLineOne,
      prefixOtherLines: prefixOtherLines,
      prefixLastChildLineOne: prefixLastChildLineOne,
      prefixOtherLinesRootNode: prefixOtherLinesRootNode,
      linkCharacter: linkCharacter,
      propertyPrefixIfChildren: propertyPrefixIfChildren,
      propertyPrefixNoChildren: propertyPrefixNoChildren,
      lineBreak: lineBreak,
      lineBreakProperties: lineBreakProperties,
      afterName: afterName,
      afterDescriptionIfBody: afterDescriptionIfBody,
      afterDescription: afterDescription,
      beforeProperties: beforeProperties,
      afterProperties: afterProperties,
      mandatoryAfterProperties: mandatoryAfterProperties,
      propertySeparator: propertySeparator,
      bodyIndent: bodyIndent,
      footer: footer,
      showChildren: showChildren,
      addBlankLineIfNoChildren: addBlankLineIfNoChildren,
      isNameOnOwnLine: isNameOnOwnLine,
      isBlankLineBetweenPropertiesAndChildren: isBlankLineBetweenPropertiesAndChildren,
      beforeName: beforeName,
      suffixLineOne: suffixLineOne,
      mandatoryFooter: mandatoryFooter,
    ),
);
var _textTreeRenderer = MXFunctionInvoke(
    "TextTreeRenderer",
    (
      {
      DiagnosticLevel minLevel = DiagnosticLevel.debug,
      int wrapWidth = 100,
      int wrapWidthProperties = 65,
      int maxDescendentsTruncatableNode = -1,
      }
    ) =>
      TextTreeRenderer(
      minLevel: minLevel,
      wrapWidth: wrapWidth,
      wrapWidthProperties: wrapWidthProperties,
      maxDescendentsTruncatableNode: maxDescendentsTruncatableNode,
    ),
);
var _diagnosticsProperty = MXFunctionInvoke(
    "DiagnosticsProperty",
    (
      {
      String name,
      dynamic value,
      String description,
      String ifNull,
      String ifEmpty,
      bool showName = true,
      bool showSeparator = true,
      Object defaultValue,
      String tooltip,
      bool missingIfNull = false,
      String linePrefix,
      bool expandableValue = false,
      bool allowWrap = true,
      bool allowNameWrap = true,
      DiagnosticsTreeStyle style = DiagnosticsTreeStyle.singleLine,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      DiagnosticsProperty(
      name,
      value,
      description: description,
      ifNull: ifNull,
      ifEmpty: ifEmpty,
      showName: showName,
      showSeparator: showSeparator,
      defaultValue: defaultValue,
      tooltip: tooltip,
      missingIfNull: missingIfNull,
      linePrefix: linePrefix,
      expandableValue: expandableValue,
      allowWrap: allowWrap,
      allowNameWrap: allowNameWrap,
      style: style,
      level: level,
    ),
);
var _diagnosticsProperty_lazy = MXFunctionInvoke(
  "diagnosticsProperty.lazy",
    (
      {
      String name,
      dynamic computeValue,
      String description,
      String ifNull,
      String ifEmpty,
      bool showName = true,
      bool showSeparator = true,
      Object defaultValue,
      String tooltip,
      bool missingIfNull = false,
      bool expandableValue = false,
      bool allowWrap = true,
      bool allowNameWrap = true,
      DiagnosticsTreeStyle style = DiagnosticsTreeStyle.singleLine,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      DiagnosticsProperty.lazy(
      name,
      computeValue,
      description: description,
      ifNull: ifNull,
      ifEmpty: ifEmpty,
      showName: showName,
      showSeparator: showSeparator,
      defaultValue: defaultValue,
      tooltip: tooltip,
      missingIfNull: missingIfNull,
      expandableValue: expandableValue,
      allowWrap: allowWrap,
      allowNameWrap: allowNameWrap,
      style: style,
      level: level,
    ),
);
var _messageProperty = MXFunctionInvoke(
    "MessageProperty",
    (
      {
      String name,
      String message,
      DiagnosticsTreeStyle style = DiagnosticsTreeStyle.singleLine,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      MessageProperty(
      name,
      message,
      style: style,
      level: level,
    ),
);
var _stringProperty = MXFunctionInvoke(
    "StringProperty",
    (
      {
      String name,
      String value,
      String description,
      String tooltip,
      bool showName = true,
      Object defaultValue,
      bool quoted = true,
      String ifEmpty,
      DiagnosticsTreeStyle style = DiagnosticsTreeStyle.singleLine,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      StringProperty(
      name,
      value,
      description: description,
      tooltip: tooltip,
      showName: showName,
      defaultValue: defaultValue,
      quoted: quoted,
      ifEmpty: ifEmpty,
      style: style,
      level: level,
    ),
);
var _doubleProperty = MXFunctionInvoke(
    "DoubleProperty",
    (
      {
      String name,
      double value,
      String ifNull,
      String unit,
      String tooltip,
      Object defaultValue,
      bool showName = true,
      DiagnosticsTreeStyle style = DiagnosticsTreeStyle.singleLine,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      DoubleProperty(
      name,
      value,
      ifNull: ifNull,
      unit: unit,
      tooltip: tooltip,
      defaultValue: defaultValue,
      showName: showName,
      style: style,
      level: level,
    ),
);
var _doubleProperty_lazy = MXFunctionInvoke(
  "doubleProperty.lazy",
    (
      {
      String name,
      dynamic computeValue,
      String ifNull,
      bool showName = true,
      String unit,
      String tooltip,
      Object defaultValue,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      DoubleProperty.lazy(
      name,
      computeValue,
      ifNull: ifNull,
      showName: showName,
      unit: unit,
      tooltip: tooltip,
      defaultValue: defaultValue,
      level: level,
    ),
);
var _intProperty = MXFunctionInvoke(
    "IntProperty",
    (
      {
      String name,
      int value,
      String ifNull,
      bool showName = true,
      String unit,
      Object defaultValue,
      DiagnosticsTreeStyle style = DiagnosticsTreeStyle.singleLine,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      IntProperty(
      name,
      value,
      ifNull: ifNull,
      showName: showName,
      unit: unit,
      defaultValue: defaultValue,
      style: style,
      level: level,
    ),
);
var _percentProperty = MXFunctionInvoke(
    "PercentProperty",
    (
      {
      String name,
      double fraction,
      String ifNull,
      bool showName = true,
      String tooltip,
      String unit,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      PercentProperty(
      name,
      fraction,
      ifNull: ifNull,
      showName: showName,
      tooltip: tooltip,
      unit: unit,
      level: level,
    ),
);
var _flagProperty = MXFunctionInvoke(
    "FlagProperty",
    (
      {
      String name,
      bool value,
      String ifTrue,
      String ifFalse,
      bool showName = false,
      Object defaultValue,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      FlagProperty(
      name,
      value: value,
      ifTrue: ifTrue,
      ifFalse: ifFalse,
      showName: showName,
      defaultValue: defaultValue,
      level: level,
    ),
);
var _iterableProperty = MXFunctionInvoke(
    "IterableProperty",
    (
      {
      String name,
      Iterable<dynamic> value,
      Object defaultValue,
      String ifNull,
      String ifEmpty = '[]',
      DiagnosticsTreeStyle style = DiagnosticsTreeStyle.singleLine,
      bool showName = true,
      bool showSeparator = true,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      IterableProperty(
      name,
      value,
      defaultValue: defaultValue,
      ifNull: ifNull,
      ifEmpty: ifEmpty,
      style: style,
      showName: showName,
      showSeparator: showSeparator,
      level: level,
    ),
);
var _enumProperty = MXFunctionInvoke(
    "EnumProperty",
    (
      {
      String name,
      dynamic value,
      Object defaultValue,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      EnumProperty(
      name,
      value,
      defaultValue: defaultValue,
      level: level,
    ),
);
var _objectFlagProperty = MXFunctionInvoke(
    "ObjectFlagProperty",
    (
      {
      String name,
      dynamic value,
      String ifPresent,
      String ifNull,
      bool showName = false,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      ObjectFlagProperty(
      name,
      value,
      ifPresent: ifPresent,
      ifNull: ifNull,
      showName: showName,
      level: level,
    ),
);
var _objectFlagProperty_has = MXFunctionInvoke(
  "objectFlagProperty.has",
    (
      {
      String name,
      dynamic value,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      ObjectFlagProperty.has(
      name,
      value,
      level: level,
    ),
);
var _flagsSummary = MXFunctionInvoke(
    "FlagsSummary",
    (
      {
      String name,
      Map<String, dynamic> value,
      String ifEmpty,
      bool showName = true,
      bool showSeparator = true,
      DiagnosticLevel level = DiagnosticLevel.info,
      }
    ) =>
      FlagsSummary(
      name,
      value,
      ifEmpty: ifEmpty,
      showName: showName,
      showSeparator: showSeparator,
      level: level,
    ),
);
var _diagnosticableNode = MXFunctionInvoke(
    "DiagnosticableNode",
    (
      {
      String name,
      Diagnosticable value,
      DiagnosticsTreeStyle style,
      }
    ) =>
      DiagnosticableNode(
      name: name,
      value: value,
      style: style,
    ),
);
var _diagnosticableTreeNode = MXFunctionInvoke(
    "DiagnosticableTreeNode",
    (
      {
      String name,
      DiagnosticableTree value,
      DiagnosticsTreeStyle style,
      }
    ) =>
      DiagnosticableTreeNode(
      name: name,
      value: value,
      style: style,
    ),
);
var _diagnosticPropertiesBuilder = MXFunctionInvoke(
    "DiagnosticPropertiesBuilder",
    (
    ) =>
      DiagnosticPropertiesBuilder(
    ),
);
var _diagnosticPropertiesBuilder_fromProperties = MXFunctionInvoke(
  "diagnosticPropertiesBuilder.fromProperties",
    (
      {
      List<DiagnosticsNode> properties,
      }
    ) =>
      DiagnosticPropertiesBuilder.fromProperties(
      properties,
    ),
);
var _diagnosticsBlock = MXFunctionInvoke(
    "DiagnosticsBlock",
    (
      {
      String name,
      DiagnosticsTreeStyle style = DiagnosticsTreeStyle.whitespace,
      bool showName = true,
      bool showSeparator = true,
      String linePrefix,
      Object value,
      String description,
      DiagnosticLevel level = DiagnosticLevel.info,
      bool allowTruncate = false,
      List<DiagnosticsNode> children,
      List<DiagnosticsNode> properties,
      }
    ) =>
      DiagnosticsBlock(
      name: name,
      style: style,
      showName: showName,
      showSeparator: showSeparator,
      linePrefix: linePrefix,
      value: value,
      description: description,
      level: level,
      allowTruncate: allowTruncate,
      children: children,
      properties: properties,
    ),
);
var _partialStackFrame = MXFunctionInvoke(
    "PartialStackFrame",
    (
      {
      Pattern package,
      String className,
      String method,
      }
    ) =>
      PartialStackFrame(
      package: package,
      className: className,
      method: method,
    ),
);
var _repetitiveStackFrameFilter = MXFunctionInvoke(
    "RepetitiveStackFrameFilter",
    (
      {
      List<PartialStackFrame> frames,
      String replacement,
      }
    ) =>
      RepetitiveStackFrameFilter(
      frames: frames,
      replacement: replacement,
    ),
);
var _errorDescription = MXFunctionInvoke(
    "ErrorDescription",
    (
      {
      String message,
      }
    ) =>
      ErrorDescription(
      message,
    ),
);
var _errorSummary = MXFunctionInvoke(
    "ErrorSummary",
    (
      {
      String message,
      }
    ) =>
      ErrorSummary(
      message,
    ),
);
var _errorHint = MXFunctionInvoke(
    "ErrorHint",
    (
      {
      String message,
      }
    ) =>
      ErrorHint(
      message,
    ),
);
var _errorSpacer = MXFunctionInvoke(
    "ErrorSpacer",
    (
    ) =>
      ErrorSpacer(
    ),
);
var _flutterErrorDetails = MXFunctionInvoke(
    "FlutterErrorDetails",
    (
      {
      dynamic exception,
      StackTrace stack,
      String library = 'Flutter framework',
      DiagnosticsNode context,
      dynamic stackFilter,
      dynamic informationCollector,
      bool silent = false,
      }
    ) =>
      FlutterErrorDetails(
      exception: exception,
      stack: stack,
      library: library,
      context: context,
      stackFilter: createGenericValueGenericClosure<Iterable<String>, Iterable<String>>(_flutterErrorDetails.buildOwner, stackFilter),
      informationCollector: informationCollector,
      silent: silent,
    ),
);
var _flutterError = MXFunctionInvoke(
    "FlutterError",
    (
      {
      String message,
      }
    ) =>
      FlutterError(
      message,
    ),
);
var _flutterError_fromParts = MXFunctionInvoke(
  "flutterError.fromParts",
    (
      {
      List<DiagnosticsNode> diagnostics,
      }
    ) =>
      FlutterError.fromParts(
      diagnostics,
    ),
);
var _diagnosticsStackTrace = MXFunctionInvoke(
    "DiagnosticsStackTrace",
    (
      {
      String name,
      StackTrace stack,
      dynamic stackFilter,
      bool showSeparator = true,
      }
    ) =>
      DiagnosticsStackTrace(
      name,
      stack,
      stackFilter: createGenericValueGenericClosure<Iterable<String>, Iterable<String>>(_diagnosticsStackTrace.buildOwner, stackFilter),
      showSeparator: showSeparator,
    ),
);
var _diagnosticsStackTrace_singleFrame = MXFunctionInvoke(
  "diagnosticsStackTrace.singleFrame",
    (
      {
      String name,
      String frame,
      bool showSeparator = true,
      }
    ) =>
      DiagnosticsStackTrace.singleFrame(
      name,
      frame: frame,
      showSeparator: showSeparator,
    ),
);
class MXDiagnosticLevel {
  static Map str2VMap = {
    'DiagnosticLevel.hidden': DiagnosticLevel.hidden,
    'DiagnosticLevel.fine': DiagnosticLevel.fine,
    'DiagnosticLevel.debug': DiagnosticLevel.debug,
    'DiagnosticLevel.info': DiagnosticLevel.info,
    'DiagnosticLevel.warning': DiagnosticLevel.warning,
    'DiagnosticLevel.hint': DiagnosticLevel.hint,
    'DiagnosticLevel.summary': DiagnosticLevel.summary,
    'DiagnosticLevel.error': DiagnosticLevel.error,
    'DiagnosticLevel.off': DiagnosticLevel.off,
  };
  static DiagnosticLevel parse(dynamic value) {
    if (value is Map) {
      var valueStr = value["_name"].trim();
      var v = str2VMap[valueStr];
      return v;
    } else {
      return value;
    }
  }
}
class MXDiagnosticsTreeStyle {
  static Map str2VMap = {
    'DiagnosticsTreeStyle.none': DiagnosticsTreeStyle.none,
    'DiagnosticsTreeStyle.sparse': DiagnosticsTreeStyle.sparse,
    'DiagnosticsTreeStyle.offstage': DiagnosticsTreeStyle.offstage,
    'DiagnosticsTreeStyle.dense': DiagnosticsTreeStyle.dense,
    'DiagnosticsTreeStyle.transition': DiagnosticsTreeStyle.transition,
    'DiagnosticsTreeStyle.error': DiagnosticsTreeStyle.error,
    'DiagnosticsTreeStyle.whitespace': DiagnosticsTreeStyle.whitespace,
    'DiagnosticsTreeStyle.flat': DiagnosticsTreeStyle.flat,
    'DiagnosticsTreeStyle.singleLine': DiagnosticsTreeStyle.singleLine,
    'DiagnosticsTreeStyle.errorProperty': DiagnosticsTreeStyle.errorProperty,
    'DiagnosticsTreeStyle.shallow': DiagnosticsTreeStyle.shallow,
    'DiagnosticsTreeStyle.truncateChildren': DiagnosticsTreeStyle.truncateChildren,
  };
  static DiagnosticsTreeStyle parse(dynamic value) {
    if (value is Map) {
      var valueStr = value["_name"].trim();
      var v = str2VMap[valueStr];
      return v;
    } else {
      return value;
    }
  }
}
