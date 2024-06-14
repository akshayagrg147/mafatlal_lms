// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Constants {
  //static const String appName = "Gajera Group";
  static const String appName = "Residieons";
  static const fontFamily = "popins";
  static RegExp youtubeRegex = RegExp(
      r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$");
  static RegExp gstNumberRegex =
  RegExp(r'\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}');
  static RegExp htmlExp =
  RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  static const downloadFolder = "storage/emulated/0/Downloads/";
  static const cardGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, childAspectRatio: 9 / 2.5);

  static const menuOptionGridDelegate =
  SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    childAspectRatio: 1,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  );



  static const limit = 10;

  static List<String> facingList = [
    'East',
    "West",
    "North",
    "South",
    "North-East",
    "South-East",
    "North-West",
    "South-West"
  ];
  static List<String> flatStatusList = [
    "Under construction",
    "Available",
    "Book",
    "Hold",
    "Registry"
  ];

}

class Direction {
  static const up = 0;
  static const down = 1;
  static const left = 2;
  static const right =3;

}