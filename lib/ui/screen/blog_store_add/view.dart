import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/text_style.dart';
import '../../../style/theme.dart';
import '../../customWidgets/CustomTextField.dart';
import '../../customWidgets/customActionBar.dart';
import '../../customWidgets/root_containers.dart';
import 'logic.dart';

class BlogStoreAddPage extends StatelessWidget {
  BlogStoreAddPage({Key? key}) : super(key: key);

  final logic = Get.put(BlogStoreAddLogic());
  final state = Get.find<BlogStoreAddLogic>().state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(
      Scaffold(
        body: Container(
          color: AppColors.white,
          height: Get.height,
          child: Column(
            children: [
              CustomActionbar('Blog Store'.tr, () {
                Get.back();
              }),
              Expanded(
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: Get.width,
                    decoration: RootContainers.instance.getBoxDecorations(
                        AppColors.priceShowColor, 5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('Title :',
                                style: getTextStyle(15, FontWeight.normal, AppColors.textFieldTopColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),),
                          CustomTextFields(
                              "",
                              state.titleController,
                              TextInputType.number),
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('Description',
                                style: getTextStyle(15, FontWeight.normal, AppColors.textFieldTopColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),),
                          CustomTextFields(
                              "",
                              state.descriptionController,
                              TextInputType.text),
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('Date :',
                                style: getTextStyle(15, FontWeight.normal, AppColors.textFieldTopColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),),
                          CustomTextFields(
                              "",
                              state.dateController,
                              TextInputType.number),
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('ID :',
                                style: getTextStyle(15, FontWeight.normal, AppColors.textFieldTopColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),),
                          CustomTextFields(
                              "",
                              state.idController,
                              TextInputType.number),
                          SizedBox(height: 10,),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.takaColor, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  //logic.onSubmit();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30),
                  child: Text('Add'.tr,
                      style: buttonTextStyle),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
