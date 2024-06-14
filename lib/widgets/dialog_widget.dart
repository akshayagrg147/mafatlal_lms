// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/widgets/text_view.dart';

class DialogWidget extends StatelessWidget {
  final String dialogTitle;
  final double? height;
  final double? minHeight;
  final Widget child;
  final bool showClose;
  final bool addPadding;
  final VoidCallback? onCloseClick;

  DialogWidget({
    Key? key,
    required this.dialogTitle,
    this.height,
    this.addPadding = true,
    required this.child,
    this.showClose = false,
    this.onCloseClick,
    this.minHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: addPadding ? MediaQueryData.fromView(View.of(context)).padding.top : 0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            constraints: BoxConstraints(
              minHeight: minHeight ?? 0,
              maxHeight: height ?? Get.height / 1.2,
            ),
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 15,
                    ),
                    child: Stack(
                      children: [

                        Align(
                          alignment: Alignment.center,
                          child: TextView(
                            dialogTitle,
                            textAlign: TextAlign.center,
                            fontsize: 18,
                            fontweight: FontWeight.w600,
                          ),
                        ),

                        if (showClose)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                onTap: () {
                                  onCloseClick!();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 20,
                                )),
                          )
                        else
                          const Offstage(),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: CircleAvatar(
                        //     radius: 15,
                        //     backgroundColor: Colors.white,
                        //     child: IconButton(
                        //       padding: EdgeInsets.zero,
                        //       constraints: const BoxConstraints(),
                        //       onPressed: onCloseClick ??
                        //           () {
                        //             Get.back();
                        //           },
                        //       icon: const Icon(
                        //         Icons.cancel_outlined,
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Color(0x193F526D),
                    height: 0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
