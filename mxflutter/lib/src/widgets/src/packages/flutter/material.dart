//  MXFlutterFramework
//  Copyright 2019 The MXFlutter Authors. All rights reserved.
//
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:mxflutter/src/mirror/mx_mirror.dart';
import 'src/material/about.dart';
import 'src/material/animated_icons.dart';
import 'src/material/app.dart';
import 'src/material/icon_button.dart';
import 'src/material/arc.dart';
import 'src/material/banner.dart';
import 'src/material/bottom_app_bar.dart';
import 'src/material/bottom_navigation_bar.dart';
import 'src/material/bottom_sheet_theme.dart';
import 'src/material/card.dart';
import 'src/material/checkbox.dart';
import 'src/material/checkbox_list_tile.dart';
import 'src/material/chip.dart';
import 'src/material/circle_avatar.dart';
import 'src/material/colors.dart';
import 'src/material/constants.dart';
import 'src/material/data_table.dart';
import 'src/material/data_table_source.dart';
import 'src/material/drawer_header.dart';
import 'src/material/dropdown.dart';
import 'src/material/expand_icon.dart';
import 'src/material/expansion_panel.dart';
import 'src/material/expansion_tile.dart';
import 'src/material/floating_action_button_theme.dart';
import 'src/material/flutter_logo.dart';
import 'src/material/grid_tile.dart';
import 'src/material/grid_tile_bar.dart';
import 'src/material/icons.dart';
import 'src/material/ink_decoration.dart';
import 'src/material/ink_ripple.dart';
import 'src/material/input_border.dart';
import 'src/material/material_state.dart';
import 'src/material/mergeable_material.dart';
import 'src/material/page.dart';
import 'src/material/paginated_data_table.dart';
import 'src/material/pickers/pickers.dart';
import 'src/material/popup_menu.dart';
import 'src/material/progress_indicator.dart';
import 'src/material/radio.dart';
import 'src/material/radio_list_tile.dart';
import 'src/material/range_slider.dart';
import 'src/material/refresh_indicator.dart';
import 'src/material/scrollbar.dart';
import 'src/material/search.dart';
import 'src/material/selectable_text.dart';
import 'src/material/shadows.dart';
import 'src/material/slider.dart';
import 'src/material/stepper.dart';
import 'src/material/switch.dart';
import 'src/material/switch_list_tile.dart';
import 'src/material/tab_controller.dart';
import 'src/material/tab_indicator.dart';
import 'src/material/text_field.dart';
import 'src/material/text_form_field.dart';
import 'src/material/text_selection.dart';
import 'src/material/typography.dart';
import 'src/material/time_picker.dart';
import 'src/material/toggle_buttons.dart';
import 'src/material/toggleable.dart';
import 'src/material/user_accounts_drawer_header.dart';
import 'src/material/curves.dart';
import 'src/material/pickers/calendar_date_picker.dart';
import 'src/material/pickers/date_picker_common.dart';
import 'src/material/pickers/date_picker_deprecated.dart';
import 'src/material/pickers/date_picker_dialog.dart';
import 'src/material/pickers/input_date_picker.dart';
import 'src/material/pickers/date_utils.dart';
import 'src/material/pickers/date_picker_header.dart';


Map<String, MXFunctionInvoke> registerMaterialLibrarySeries() {
  Map<String, MXFunctionInvoke> m = {};
  m.addAll(registerAboutSeries());
  m.addAll(registerAnimatedIconsSeries());
  m.addAll(registerAppSeries());
  m.addAll(registerIconButtonSeries());
  m.addAll(registerArcSeries());
  m.addAll(registerBannerSeries());
  m.addAll(registerBottomAppBarSeries());
  m.addAll(registerBottomNavigationBarSeries());
  m.addAll(registerBottomSheetThemeSeries());
  m.addAll(registerCardSeries());
  m.addAll(registerCheckboxSeries());
  m.addAll(registerCheckboxListTileSeries());
  m.addAll(registerChipSeries());
  m.addAll(registerCircleAvatarSeries());
  m.addAll(registerColorsSeries());
  m.addAll(registerConstantsSeries());
  m.addAll(registerDataTableSeries());
  m.addAll(registerDataTableSourceSeries());
  m.addAll(registerDrawerHeaderSeries());
  m.addAll(registerDropdownSeries());
  m.addAll(registerExpandIconSeries());
  m.addAll(registerExpansionPanelSeries());
  m.addAll(registerExpansionTileSeries());
  m.addAll(registerFloatingActionButtonThemeSeries());
  m.addAll(registerFlutterLogoSeries());
  m.addAll(registerGridTileSeries());
  m.addAll(registerGridTileBarSeries());
  m.addAll(registerIconsSeries());
  m.addAll(registerInkDecorationSeries());
  m.addAll(registerInkRippleSeries());
  m.addAll(registerInputBorderSeries());
  m.addAll(registerMaterialStateSeries());
  m.addAll(registerMergeableMaterialSeries());
  m.addAll(registerPageSeries());
  m.addAll(registerPaginatedDataTableSeries());
  m.addAll(registerPickersSeries());
  m.addAll(registerPopupMenuSeries());
  m.addAll(registerProgressIndicatorSeries());
  m.addAll(registerRadioSeries());
  m.addAll(registerRadioListTileSeries());
  m.addAll(registerRangeSliderSeries());
  m.addAll(registerRefreshIndicatorSeries());
  m.addAll(registerScrollbarSeries());
  m.addAll(registerSearchSeries());
  m.addAll(registerSelectableTextSeries());
  m.addAll(registerShadowsSeries());
  m.addAll(registerSliderSeries());
  m.addAll(registerStepperSeries());
  m.addAll(registerSwitchSeries());
  m.addAll(registerSwitchListTileSeries());
  m.addAll(registerTabControllerSeries());
  m.addAll(registerTabIndicatorSeries());
  m.addAll(registerTextFieldSeries());
  m.addAll(registerTextFormFieldSeries());
  m.addAll(registerTextSelectionSeries());
  m.addAll(registerTypographySeries());
  m.addAll(registerTimePickerSeries());
  m.addAll(registerToggleButtonsSeries());
  m.addAll(registerToggleableSeries());
  m.addAll(registerUserAccountsDrawerHeaderSeries());
  m.addAll(registerCurvesSeries());
  m.addAll(registerCalendarDatePickerSeries());
  m.addAll(registerDatePickerCommonSeries());
  m.addAll(registerDatePickerDeprecatedSeries());
  m.addAll(registerDatePickerDialogSeries());
  m.addAll(registerInputDatePickerSeries());
  m.addAll(registerDateUtilsSeries());
  m.addAll(registerDatePickerHeaderSeries());
  return m;
}
