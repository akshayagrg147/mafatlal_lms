import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/modal/open_subject_model.dart';
import 'package:teaching_app/widgets/text_view.dart';

class TopicItemWidget extends StatefulWidget {
  const TopicItemWidget({
    super.key,
    required this.topicIndex,
    this.topic,
    required this.isSelected,
    this.label,


  });

  final int topicIndex;
  final LocalTopic? topic;
  final bool isSelected;
  final String? label;

  @override
  State<TopicItemWidget> createState() => _TopicItemWidgetState();
}

class _TopicItemWidgetState extends State<TopicItemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // print("inside topic list ids : ${widget.selectedTopicId} ");
    return
    // MouseRegion(
    //   onEnter: (_) {
    //     setState(() {
    //       _isHovered = true;
    //     });
    //   },
    //   onExit: (_) {
    //     setState(() {
    //       _isHovered = false;
    //     });
    //   },
    //   child:
      InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _isHovered ? Colors.white : Colors.transparent,
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 40),
                widget.label == null
                ?widget.topic != null ?Expanded(
                  child: TextView(
                    "Topic ${widget.topicIndex + 1} -  ${widget.topic!.topic.topicName}",
                    fontweight: FontWeight.bold,
                    fontsize: 12,
                    textColor: _isHovered ? ThemeColor.darkBlue4392 : widget.isSelected ? ThemeColor.darkBlue4392 :null,
                  )
                ) :SizedBox()
                :Expanded(
                  child: TextView(
                    "${widget.topicIndex + 1}. ${widget.label}",
                    fontweight: FontWeight.bold,
                    fontsize: 12,
                    textColor: _isHovered ? ThemeColor.darkBlue4392 : widget.isSelected ? ThemeColor.darkBlue4392 :null,
                  ),
                ),
              ],
            ),
          ),
        ),
      // ),
    );
  }
}
