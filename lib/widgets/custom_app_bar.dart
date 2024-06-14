// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/widgets/image_icon.dart';
import 'package:teaching_app/widgets/text_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  String? imagePath;
  bool showLeading;
  bool centerTitle;
  Widget? bottom;
  Widget? leadingWidget;
  Widget? titleWidget;
  VoidCallback? onLeadingClick;
  List<Widget>? action;
  bool showAppbar = true;

  CustomAppBar({
    super.key,
    this.title,
    this.imagePath,
    this.showLeading = true,
    this.centerTitle = false,
    this.onLeadingClick,
    this.leadingWidget,
    this.titleWidget,
    this.action,
    this.bottom,
    required this.showAppbar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      title: titleWidget ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imagePath != null) ...[
                IconImage(
                    imagePath: imagePath!,
                    size: 24,
                    color: ThemeColor.primaryColor),
                const SizedBox(
                  width: 10,
                ),
              ],
              TextView(
                title ?? '',
                fontsize: 18,
                textColor: ThemeColor.black,
                fontweight: FontWeight.w700,
              ),
            ],
          ),
      centerTitle: centerTitle,
      elevation: 0,
      actions: action,
      leading: showLeading
          ? leadingWidget ??
          IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.keyboard_backspace_rounded,
              size: 26,
              color: ThemeColor.black,
            ),
            onPressed: onLeadingClick ?? () => Get.back(),
          )
          : const SizedBox.shrink(),
      bottom: PreferredSize(
        preferredSize: const Size(double.maxFinite, 20),
        child: bottom ?? const SizedBox(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
      Get.width, kToolbarHeight + (bottom != null ? kTextTabBarHeight : 0));
}
