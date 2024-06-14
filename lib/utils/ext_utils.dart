import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/widgets/text_view.dart';


extension DateUtils on DateTime {
  String toDateTime() {
    return DateFormat("yyyy-MM-dd HH:mm").format(toLocal());
  }

  String toTimeOnly() {
    return DateFormat("HH:mm").format(toLocal());
  }

  String toyymmddhhmm() {
    return DateFormat("yyyy-MM-dd HH:mm").format(toLocal());
  }

  String toyymmddhhmma() {
    return DateFormat("yyyy-MM-dd HH:mm a").format(toLocal());
  }
  String toyyyymmddhhmma() {
    return DateFormat("yyyy-MM-dd hh:mm a").format(toLocal());
  }


  String tohhmma() {
    return DateFormat("hh:mm a").format(toLocal());
  }

  String toHHmmss() {
    return DateFormat("HH:mm:ss").format(toLocal());
  }

  String toyymmddhhmmss() {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(toLocal());
  }

  String toyymmdd() {
    return DateFormat("yyyy-MM-dd").format(toLocal());
  }

  String ddmmmyyyy() {
    return DateFormat("dd").format(toLocal());
  }

  String toddMMM() {
    return DateFormat("dd MMM").format(toLocal());
  }

  String get mmmmyyyy => DateFormat("MMMM yyyy").format(toLocal());

  String get mmmm => DateFormat("MMMM").format(toLocal());

  String get yyyy => DateFormat("yyyy").format(toLocal());

  bool isToday() {
    var date = DateTime.now().toLocal();

    return DateTime(date.year, date.month, date.day) == this;
  }

  DateTime toDateOnly() {
    return DateTime(year, month, day).toLocal();
  }

  DateTime get lastDateOfMonth {
    return DateTime(year, month + 1)
        .subtract(const Duration(days: 1))
        .toLocal();
  }

  DateTime get firstDateOfMonth {
    return DateTime(year, month, 1).toLocal();
  }

  DateTime get lastDateOfLastMonth {
    return DateTime(year, month).subtract(const Duration(days: 1)).toLocal();
  }

  DateTime get firstDateOfLastMonth {
    return DateTime(year, month - 1, 1).toLocal();
  }

  DateTime get firstDateOfNextMonth {
    return DateTime(year, month + 1, 1).toLocal();
  }

  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(toLocal());

    if ((difference.inDays / 7).floor() >= 1) {
      return toyymmdd();
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}


extension TxtCtrl on TextEditingController {
  int toInt() {
    return text.isNotEmpty && text.isNumericOnly ? int.parse(text) : 0;
  }

  double toDouble() {
    return double.tryParse(text) ?? 0.0;
  }
}

extension NumUtil on num {
  String toMoney() => '₹ ${NumberFormat("##,##,###.##").format(this)}';

  String toPhone() => '${NumberFormat("############").format(this)}';
}


extension DropDownList<T> on List<T> {
  List<DropdownMenuItem<T>> dropDownItem(String Function(T element) name,
      {bool filled = false, Color? textColor}) {
    return map(
          (e) => DropdownMenuItem<T>(
        value: e,
        child: TextView(
          name.call(e),
          fontsize: 13,
          maxLine: 1,
          textColor: textColor ?? ThemeColor.black,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ).toList();
  }

  void toggleValue(T? value) {
    if (contains(value)) {
      remove(value);
    } else {
      add(value!);
    }
  }

  String toName(String Function(T e) name) {
    return map((e) => name.call(e)).join(",");
  }
}