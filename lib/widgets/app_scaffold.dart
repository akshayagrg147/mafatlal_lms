// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:teaching_app/widgets/custom_app_bar.dart';


class AppScaffold extends StatelessWidget {
  final String? title;
  final String? imagePath;
  final bool showLeading;
  final bool centerTitle;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? leadingWidget;
  final Widget? bottom;
  final VoidCallback? onLeadingClick;
  final List<Widget>? action;
  final Widget? footerWidget;
  final bool showAppbar;
  final bool showTopRadius;
  final Color? bgColor;

  const AppScaffold({
    Key? key,
    this.title,
    this.imagePath,
    required this.body,
    this.showLeading = true,
    this.centerTitle = false,
    this.floatingActionButton,
    this.onLeadingClick,
    this.leadingWidget,
    this.action,
    this.bgColor,
    this.showAppbar = true,
    this.showTopRadius = true,
    this.footerWidget,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: footerWidget,
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        floatingActionButton: floatingActionButton,
        appBar: showAppbar
            ? CustomAppBar(
          centerTitle: centerTitle,
          showAppbar: showAppbar,
          imagePath: imagePath,
          title: title,
          leadingWidget: leadingWidget,
          onLeadingClick: onLeadingClick,
          showLeading: showLeading,
          action: action,
        )
            : null,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: bgColor ?? Colors.white,
                borderRadius: showTopRadius
                    ? const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )
                    : BorderRadius.zero,
              ),
              margin: EdgeInsets.only(top: bottom != null ? 45 : 0),
              clipBehavior: bottom != null ? Clip.hardEdge : Clip.none,
            ),
            Container(
              decoration: bottom != null
                  ? BoxDecoration(
                color: bgColor ?? Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              )
                  : null,
              margin: EdgeInsets.only(top: bottom != null ? 45 : 0),
              clipBehavior: bottom != null ? Clip.hardEdge : Clip.none,
              child: body,
            ),
            bottom ?? const SizedBox(),
          ],
        ),
      )
    );
  }
}
