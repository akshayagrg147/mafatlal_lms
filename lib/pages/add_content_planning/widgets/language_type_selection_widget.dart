
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/add_content_planning/controller/content_planning_controller.dart';
import 'package:teaching_app/widgets/elevated_button.dart';

import '../../../widgets/text_view.dart';

Widget buildLanguageTypeSelectionWidget(ContentPlanningController controller) {
  return LayoutBuilder(builder: (context, constraints) {
    if (constraints.maxWidth < 1000)
    {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 40,right: 20,bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Row(
              children: [
                SizedBox(width: 100,child: TextView('Type:',fontsize: 16,fontweight: FontWeight.bold,)),
                Checkbox(
                    value: controller.videoSelected.value,
                    onChanged: (value) {
                      if (value != null) {
                        controller.videoSelected.value = value;
                        // controller.filterTopicData();
                      }
                    }
                ),                  TextView('Video',fontsize: 14,fontweight: FontWeight.bold,),
                Checkbox(
                    value: controller.eMaterialSelected.value,
                    onChanged: (value) {
                      if (value != null) {
                        controller.eMaterialSelected.value = value;
                        // controller.filterTopicData();
                      }
                    }
                ),                  TextView('E-material',fontsize: 14,fontweight: FontWeight.bold,),
                // Checkbox(value: _.eBookSelected.value, onChanged: (value) {if(value != null) _.eBookSelected.value = value;}),
                // TextView('E-book',fontsize: 14,fontweight: FontWeight.bold,),
                Checkbox(
                    value: controller.questionSelected.value,
                    onChanged: (value) {
                      if (value != null) {
                        controller.questionSelected.value = value;
                        // controller.filterTopicData();
                      }
                    }
                ),                  TextView('Question',fontsize: 14,fontweight: FontWeight.bold,),
              ],
            )),
            const SizedBox(height: 16),
            Obx(() => Row(
              children: [
                SizedBox(width : 100,child: TextView('Language:', fontsize: 16, fontweight: FontWeight.bold)),

                Checkbox(value: controller.hindiSelected.value, onChanged: (value) {if(value != null) controller.hindiSelected.value = value;}),
                TextView('Hindi',fontsize: 14,fontweight: FontWeight.bold,),
                Checkbox(value: controller.englishSelected.value, onChanged: (value) {if(value != null) controller.englishSelected.value = value;}),
                TextView('English',fontsize: 14,fontweight: FontWeight.bold,),
                Checkbox(value: controller.odiaSelected.value, onChanged: (value) {if(value != null) controller.odiaSelected.value = value;}),
                TextView('Odia',fontsize: 14,fontweight: FontWeight.bold,),
              ],
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Card(elevation:5,child: AppElevatedButton(title: "CREATE CONTENT",backgroundColor:ThemeColor.white,showBorder:true,borderColor: ThemeColor.darkBlue4392,onPressed: (){},)),
              const SizedBox(width: 10,),
              Card(elevation:5,child: AppElevatedButton(title: "ADD CONTENT",backgroundColor:ThemeColor.white,showBorder:true,borderColor: ThemeColor.darkBlue4392,onPressed: (){},)),
            ],)
          ],
        ),
      );
    }
    else{
      return Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 40,right: 20,bottom: 15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Row(
                    children: [
                      SizedBox(width: 100,child: TextView('Type:',fontsize: 16,fontweight: FontWeight.bold,)),
                      Checkbox(
                          value: controller.videoSelected.value,
                          onChanged: (value) {
                            if (value != null) {
                              controller.videoSelected.value = value;
                              // controller.filterTopicData();
                            }
                          }
                      ),                  TextView('Video',fontsize: 14,fontweight: FontWeight.bold,),
                      Checkbox(
                          value: controller.eMaterialSelected.value,
                          onChanged: (value) {
                            if (value != null) {
                              controller.eMaterialSelected.value = value;
                              // controller.filterTopicData();
                            }
                          }
                      ),                  TextView('E-material',fontsize: 14,fontweight: FontWeight.bold,),
                      // Checkbox(value: _.eBookSelected.value, onChanged: (value) {if(value != null) _.eBookSelected.value = value;}),
                      // TextView('E-book',fontsize: 14,fontweight: FontWeight.bold,),
                      Checkbox(
                          value: controller.questionSelected.value,
                          onChanged: (value) {
                            if (value != null) {
                              controller.questionSelected.value = value;
                              // controller.filterTopicData();
                            }
                          }
                      ),                  TextView('Question',fontsize: 14,fontweight: FontWeight.bold,),
                    ],
                  )),
                  const SizedBox(height: 16),
                  Obx(() => Row(
                    children: [
                      SizedBox(width : 100,child: TextView('Language:', fontsize: 16, fontweight: FontWeight.bold)),

                      Checkbox(value: controller.hindiSelected.value, onChanged: (value) {if(value != null) controller.hindiSelected.value = value;}),
                      TextView('Hindi',fontsize: 14,fontweight: FontWeight.bold,),
                      Checkbox(value: controller.englishSelected.value, onChanged: (value) {if(value != null) controller.englishSelected.value = value;}),
                      TextView('English',fontsize: 14,fontweight: FontWeight.bold,),
                      Checkbox(value: controller.odiaSelected.value, onChanged: (value) {if(value != null) controller.odiaSelected.value = value;}),
                      TextView('Odia',fontsize: 14,fontweight: FontWeight.bold,),
                    ],
                  ),),
                ],
              ),
            ),
            Row(children: [
              Card(elevation:5,child: AppElevatedButton(title: "CREATE CONTENT",backgroundColor:ThemeColor.white,showBorder:true,borderColor: ThemeColor.darkBlue4392,onPressed: (){},)),
              const SizedBox(width: 10,),
              Card(elevation:5,child: AppElevatedButton(title: "ADD CONTENT",backgroundColor:ThemeColor.white,showBorder:true,borderColor: ThemeColor.darkBlue4392,onPressed: (){},)),
            ],)
          ],
        ),
      );
    }


  });


}
