import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/BlogListResponse.dart';
import '../../../style/text_style.dart';
import '../../../style/theme.dart';
import '../../customWidgets/customActionBar.dart';
import '../../customWidgets/root_containers.dart';
import '../blog_store_add/view.dart';
import '../note_pad_files/note_veiw/note_veiw_view.dart';
import 'logic.dart';

class BlogListPage extends StatelessWidget {
  BlogListPage({Key? key}) : super(key: key);

  final logic = Get.put(BlogListLogic());
  final state = Get.find<BlogListLogic>().state;

  Widget _blogList(Blog? data,int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      decoration: RootContainers.instance.getBoxDecorations(
          AppColors.priceShowColor, 5),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child:Text(data?.title ?? 'null',
                        style: getTextStyle(
                            16, FontWeight.bold, AppColors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                        onTap: (){
                          showCustomDialogBox(Get.context!,'Please Confirm'.tr, 'Delete this post?'.tr,null,null,
                              onConfirm: (){
                                logic.deleteBlog(123);
                                Get.back();
                              },
                              onCancel: () {
                                Get.back();
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.highlight_remove_sharp,color: Color(0xff848484),),
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child:Text('Sub title: ' + '',
                    style: getTextStyle(
                        15, FontWeight.normal, AppColors.textLightColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Date: ',
                    style: getTextStyle(
                        15, FontWeight.normal, AppColors.splashText),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Description ' + '',
                    style: getTextStyle(
                        15, FontWeight.normal, AppColors.splashText),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  width: Get.width,
                  color: AppColors.colorDot,),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.textFieldBackGround, // background
                        onPrimary: AppColors.splashText, // foreground
                      ),
                      onPressed: () {
                      },
                      child: Text('Category ID: ' + '  ',
                        style: getTextStyle(
                            15, FontWeight.normal, AppColors.splashText),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.takaColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        Get.to(() => BlogStoreAddPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
                      },
                      child: Text('Update'.tr,
                          style: commonTextStyleWhite2),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
      return RootContainers.instance.getScaffoldRootContainer(
        Scaffold(
            body: Container(
              color: AppColors.white,
              height: Get.height,
              child: Stack(
                children: [
                  Column(
                    children: [
                      CustomActionbar('Blog List'.tr, () {
                        Get.back();
                      }),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(() => BlogStoreAddPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: RootContainers.instance
                                .getBoxDecorations(AppColors.priceShowColor, 5),
                            child:  ListTile(
                              dense: true,
                              visualDensity: VisualDensity.compact,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 16.0),
                              title:Text(
                                'Blog Store Add', style: getTextStyle(
                                  13, FontWeight.bold,
                                  AppColors.black),),
                              trailing: Icon(Icons.person_add_alt_1_rounded, size: 16, color: AppColors.greenButton,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child:Obx(() => state.isLoading.value ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                            padding: const EdgeInsets.only(left: 15.0,right: 15,top: 0,bottom: 15),
                            physics: const BouncingScrollPhysics(),
                            controller: state.scrollController,
                            scrollDirection: Axis.vertical,
                            itemCount: state.blogListResponse.value?.data.blogs.data.length ?? 0,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return _blogList(state.blogListResponse.value?.data.blogs.data[index],index);
                            }))
                        ),
                    ],
                  ),
                ],
              ),
            )

        ),
      );
  }
}
