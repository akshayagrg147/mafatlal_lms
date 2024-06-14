import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/utils/contants.dart';
import 'package:teaching_app/widgets/filled_arrow_icon_widget.dart';
import 'package:teaching_app/widgets/text_view.dart';

class AddressHeader extends StatelessWidget {
  final bool isMenuHeader;
  final String? address;
  final String? topicNumber;
  final String? topicTitle;
  const AddressHeader(
      {super.key,
      this.topicNumber,
      this.topicTitle,
      this.isMenuHeader = false,
      this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ThemeColor.white,
      ),
      height: 50,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: !isMenuHeader
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextView(
                      address ?? "",
                      textColor: ThemeColor.darkBlue4392,
                    ),
                ],
              )
              : Row(
                  children: [
                    TextView(
                      topicNumber ?? "",
                      textColor: ThemeColor.darkBlue4392,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const FilledArrowIcon(direction: Direction.right),
                    const SizedBox(
                      width: 10,
                    ),
                    TextView(
                      topicTitle ?? "",
                      textColor: ThemeColor.darkBlue4392,
                    ),
                  ],
                )),
    );
  }
}
