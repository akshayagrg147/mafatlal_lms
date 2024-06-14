import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/widgets/text_view.dart';

class ColumnAppRichText extends StatelessWidget {
  final String title;
  final Widget? titleWidget;
  final String? content;
  final Widget? child;
  final double? fontSize;
  final double? height;
  final TextDecoration textDecoration;
  final bool setWidth;
  final bool isPhone;
  final Decoration? decoration;
  final Color? contentColor;

  const ColumnAppRichText({
    Key? key,
    required this.title,
    this.titleWidget,
    this.content,
    this.contentColor,
    this.decoration,
    this.fontSize = 12,
    this.height,
    this.child,
    this.isPhone = false,
    this.setWidth = false,
    this.textDecoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      constraints: BoxConstraints(
        minWidth: setWidth ? Get.width / 3 : Get.width,
        maxWidth: setWidth ? Get.width / 2.3 : Get.width,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget == null
          ?TextView(
            "$title:",
            fontsize: fontSize,
            textColor: const Color(0xFF626262),
            fontweight: FontWeight.w400,
          ):titleWidget!,
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: null,
            child: Container(
              decoration: decoration,
              child: Padding(
                padding: decoration != null
                    ? const EdgeInsets.all(8.0)
                    : const EdgeInsets.all(0),
                child: child ??
                    TextView(
                      content ?? "",
                      overflow: TextOverflow.ellipsis,
                      fontsize: fontSize,
                      textColor: contentColor ??
                          (decoration != null
                              ? ThemeColor.white
                              : ThemeColor.itemCardTxtColor),
                      decoration:
                      isPhone ? TextDecoration.underline : textDecoration,
                      fontweight: FontWeight.w500,
                      maxLine: 10,
                      fontFamily: 'Poppins',
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowAppRichText extends StatelessWidget {
  String? title;
  String? content;
  Widget? child;
  double? fontSize;
  double? height;
  TextDecoration textDecoration;
  TextDecoration titleTextDecoration;
  bool setWidth = true;
  String? imagePath;
  bool isPhone = false;
  Color? titleColor;
  Color? contentColor;
  Color? iconBgColor;
  FontWeight? titleFontWeight;
  FontWeight? contentFontWeight;
  double? iconSize;
  // ImageType? imageType;

  RowAppRichText({
    Key? key,
    this.title,
    this.content,
    this.fontSize = 12,
    this.height,
    this.child,
    this.imagePath,
    this.titleColor,
    this.contentColor = ThemeColor.black,
    this.iconBgColor = ThemeColor.iconBgColor,
    this.isPhone = false,
    this.setWidth = false,
    this.textDecoration = TextDecoration.none,
    this.titleTextDecoration = TextDecoration.none,
    this.titleFontWeight,
    this.contentFontWeight = FontWeight.w600,
    this.iconSize = 20,
    // this.imageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      constraints: BoxConstraints(
        minWidth: setWidth ? Get.width / 3 : Get.width,
        maxWidth: setWidth ? Get.width / 2.3 : Get.width,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: title == "Description"
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          if (imagePath != null) ...[
            // CircleImageView(
            //   imagePath: imagePath!,
            //   imageType: imageType ?? ImageType.asset,
            //   radius: 16,
            //   iconSize: iconSize,
            //   // clip: false,
            //   padding: EdgeInsets.zero,
            //   backgroundColor: iconBgColor,
            // ),
            const SizedBox(
              width: 10,
            ),
          ],
          if (title != null) ...[
            TextView(
              "$title:",
              fontsize: fontSize,
              textColor: titleColor ?? ThemeColor.titleColorLight2,
              fontweight: titleFontWeight,
              decoration: titleTextDecoration,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          Flexible(
            child: InkWell(
              onTap: null,
              child: child ??
                  TextView(
                    content ?? "",
                    fontsize: fontSize,
                    fontweight: contentFontWeight,
                    textColor: contentColor ?? ThemeColor.itemCardTxtColor,
                    decoration:
                    isPhone ? TextDecoration.underline : textDecoration,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColumnAppRichTextWithIcon extends StatelessWidget {
  String? title;
  String? content;
  Widget? child;
  double? fontSize;
  double? height;
  TextDecoration textDecoration;
  bool setWidth = true;
  String? imagePath;
  bool isPhone = false;
  Color? titleColor;
  Color? contentColor;
  Color? iconBgColor;
  FontWeight? titleFontWeight;
  FontWeight? contentFontWeight;
  double? iconSize;

  ColumnAppRichTextWithIcon({
    Key? key,
    this.title,
    this.content,
    this.fontSize = 12,
    this.height,
    this.child,
    this.imagePath,
    this.titleColor,
    this.contentColor = ThemeColor.black,
    this.iconBgColor = ThemeColor.iconBgColorNew,
    this.isPhone = false,
    this.setWidth = false,
    this.textDecoration = TextDecoration.none,
    this.titleFontWeight = FontWeight.w500,
    this.contentFontWeight = FontWeight.w600,
    this.iconSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      constraints: BoxConstraints(
        minWidth: setWidth ? Get.width / 3 : Get.width,
        maxWidth: setWidth ? Get.width / 2.3 : Get.width,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imagePath != null) ...[
            // CircleImageView(
            //   imagePath: imagePath!,
            //   imageType: ImageType.asset,
            //   radius: 16,
            //   iconSize: iconSize,
            //   clip: false,
            //   padding: EdgeInsets.zero,
            //   backgroundColor: iconBgColor,
            // ),
            const SizedBox(
              width: 10,
            ),
          ],
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  TextView(
                    "$title:",
                    fontsize: fontSize,
                    textColor: titleColor ?? ThemeColor.titleColorLightNew,
                    fontweight: titleFontWeight,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
                InkWell(
                  onTap:null,
                  child: child ??
                      TextView(
                        content ?? "",
                        fontsize: fontSize,
                        textColor: contentColor ?? ThemeColor.itemCardTxtColor,
                        fontweight: contentFontWeight,
                        decoration:
                        isPhone ? TextDecoration.underline : textDecoration,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
