import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teaching_app/utils/contants.dart';

class ThemeColor {

  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const black = Color(0xFF121212);
  static const headerBgColor = Color(0xFFF1F5F9);
  static const commonDarkBlueColor = Color(0xFF174392);
  static const scaffoldBgColor= Color(0xFFF8F8F8);
  static const darkBlue4392= Color(0xFF004392);
  static const darkRed0000= Color(0xFFAD0000);
  static const darkGreen8326= Color(0xFF028326);
  static const lightBlueF5F9= Color(0xFFF1F5F9);



  static const iconUnselected = Color.fromRGBO(255, 255, 255, 0.60);
  static const appBg = Color.fromRGBO(249, 249, 249, 1);
  static const blackWithopacity = Color.fromRGBO(0, 0, 0, 0.04);
  static const actionIconColor = Color.fromRGBO(65, 77, 81, 1);
  static const redBgColor = Color(0xffFC5185);
  static const purpleBgColor = Color(0xff5025D1);
  static const yellowBgColor = Color(0xffF8B849);
  static const lightPurpleBgColor = Color(0xffDCDBFC);
  static const bottomIconColor = Color.fromRGBO(0, 88, 94, 1);
  static const greyLight = Color(0xFFD1D1D1);
  static const disableColor = Color(0xFFA8A8A8);
  static const loginButtonColor = Color(0xFFFC5185);
  static const itemCardBg = Color(0xFFFAFEFE);
  static const itemCardTxtColor = Color(0xFF139099);
  static const itemCardBgColor = Color(0xFFF6F4FC);
  static const itemCardDashboardAnnouncementBgColor = Color(0xFF5025D1);
  static const outgoingCall = Color(0xFFF8B849);
  static const incomingCall = Color(0xFF1F998E);
  static const missedCall = Color(0xFFE8523F);
  static const textFieldFilledColor = Color(0xFFF8F8F8);
  static const primaryColor = Color(0xFF19C0CC);
  static const dropDownColor = Color(0xFF2DCCFF);
  static const item1Bg = Color(0xFFE8523F);
  static const item1SBg = Color(0xFFF9D3CF);
  // static const item1Bg = Color(0xFFFF9F2D);
  static const item2Bg = Color(0xFF6672FB);
  static const item2SBg = Color(0xFFD8DBFE);
  // static const item2Bg = Color(0xFF1B57FF);
  // static const item3Bg = Color(0xFF19CBD7);
  static const item3Bg = Color(0xFFF8B849);
  static const item3SBg = Color(0xFFFDEDD1);
  static const item4Bg = Color(0xFFB15EFF);
  static const item4SBg = Color(0xFF1F998E);
  // static const item4Bg = Color(0xFFB15EFF);
  static const item5Bg = Color(0xFF776B5D);
  static const item6Bg = Color(0xFF363062);
  static const editIconColor = Color(0xFF54B435);
  static const deleteIconColor = Color(0xFFED2B2A);
  static const viewIconColor = Color(0xFF004225);
  static const negativeBtnTxt = Color(0xFF7D7D7D);
  static const rejectBtnColor = Color(0xFFD21312);
  static const leadStatusBG = Color(0x33E30000);
  static const leadStatusBorder = Color(0xFFE30000);
  static const dividerColor = Color(0xFFF8F8F8);
  // static const dividerColor = Color(0xFFE0E0E0);
  static const iconBgColor = Color(0x3319C0CC);
  static const iconBgColorNew = Color(0xffF4F4FE);
  static const titleColorLight = Color(0xFF818181);
  static const titleColorLight2 = Color(0xFF626262);
  static const titleColorLightNew = Color(0xFF5E5E5E);
  static const textColorLight = Color(0xffA8A8A8);
  static const selectionChipBorderColor = Color(0xffA8A8A8);
  static const transparent = Color(0x00000000);
  static const dividerDark = Color(0xFFC7C7C7);
  static const tabLabelLight = Color(0xFF9C9C9C);
  static const noFileTxtColor = Color(0xFF9B9B9B);
  static const propertyWorkBg = Color(0xFF11499B);
  static const tabBarBg = Color(0x0C19C0CC);
  static const fileBtnColor = Color(0xFFEFEFEF);
  static const edtLabelColor = Color(0xFF6C6C6C);
  static const blackDivider = Color.fromRGBO(0, 0, 0, 0.1);
  static const propertyMediaItemBg = Color(0xFFF2F2F2);
  static const green = Color(0xff2CB875);
  static const red = Color.fromARGB(255, 255, 32, 32);
  static const errorBG = Color.fromARGB(255, 255, 215, 215);
  static const msgBG = Color(0xFFD7F9FF);
  static const priorityHighBg = Color(0xffff6565);
  static const priorityMediumBg = Color(0xff6594ff);
  static const priorityLowBg = Color(0xffe7ca00);
  static const notesItemColor = Color(0x1919C0CC);
  static const appDrawerLight = Color(0xFF555377);
  static const pieChartCenterColor = Color(0xFF5025D1);

  static List<Color> noteColors = [
    const Color(0xFFFFFBF1),
    const Color(0xFFDDFBFF),
    const Color(0xFFE3D3C3),
    const Color(0xFFE2EFD6),
    const Color(0xFFFFEAAE),
    const Color(0xFFEDD6FF)
  ];
  static List<Color> reminderColors = [
    const Color(0xFFAF2655),
    const Color(0xFF508D69),
  ];
  static List<Color> optionColorList = [
    const Color(0xFF435585),
    const Color(0xFF4F6F52),
    const Color(0xFF7071E8),
    const Color(0xFFFF9209),
    const Color(0xFF5B0888),
    const Color(0xFF4C4B16),
    const Color(0xFFBE3144),
    const Color(0xFF5B0888),
  ];
  static List<Color> activityHistoryColors = [
    const Color(0xFFFF7533),
    const Color(0xFF11499B),
    const Color(0xFFAE23D1),
    const Color(0xFF79641D),
  ];
  static ThemeData blueTheme = ThemeData(
    primaryColor: appBg,
    useMaterial3: false,
    scaffoldBackgroundColor: appBg,
    fontFamily: Constants.fontFamily,
    tabBarTheme: const TabBarTheme(
      indicatorColor: ThemeColor.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: tabLabelLight,
      labelColor: black,
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(fontSize: 10),
    ),
  );
}