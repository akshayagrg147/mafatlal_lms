import 'package:flutter/material.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/widgets/image_icon.dart';

import '../utils/assets.dart';


class ActionButtons extends StatelessWidget {
  VoidCallback? onDelete;
  VoidCallback? onEdit;
  VoidCallback? onViewClick;
  VoidCallback? ondownloadClick;
  VoidCallback? onAddReminder;
  VoidCallback? onAddNotes;
  VoidCallback? onConvertClick;
  VoidCallback? onConvertToLead;
  VoidCallback? onSync;
  bool showEdit = false;
  bool showSync = false;
  bool showConvert = false;
  bool showDelete = false;
  bool showViewButton = false;
  bool downloadBtn = false;
  bool showConvertToLead = false;
  bool showMenu = false;

  ActionButtons(
      {super.key,
        this.onDelete,
        this.onConvertToLead,
        this.onEdit,
        this.showConvert = false,
        this.showSync = false,
        this.onViewClick,
        this.ondownloadClick,
        this.onAddReminder,
        this.onAddNotes,
        this.onSync,
        this.onConvertClick,
        this.showEdit = false,
        this.showViewButton = false,
        this.downloadBtn = false,
        this.showConvertToLead = false,
        this.showMenu = false,
        this.showDelete = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showViewButton) ...[
          Flexible(
            child: InkWell(
              onTap: onViewClick,
              child: IconImage(
                imagePath: AppAssets.viewIcon,
                color: ThemeColor.black,
                size: 25,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
        if (showEdit) ...[
          Flexible(
            child: InkWell(
              onTap: onEdit,
              child: IconImage(
                imagePath: AppAssets.editIcon,
                color: ThemeColor.black,
                size: 25,
              ),
            ),

          ),
          const SizedBox(
            width: 5,
          ),
        ],
        if (showDelete) ...[
          Flexible(
            child: InkWell(
              onTap: onDelete,
              child: IconImage(
                imagePath: AppAssets.deleteIcon,
                color: ThemeColor.black,
                size: 25,
              ),
            ),
          ),

          const SizedBox(
            width: 5,
          ),
        ],

      ],
    );
  }
}
