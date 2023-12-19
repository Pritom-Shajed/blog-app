import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_settings.dart';
import '../../../style/text_style.dart';
import '../../../utils/colors.dart';
import 'logic.dart';

class TestUiPage extends StatelessWidget {
  TestUiPage({Key? key}) : super(key: key);

  final logic = Get.put(TestUiLogic());
  final state = Get.find<TestUiLogic>().state;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image(image: AssetImage(
            ImageLocation.test_images + "/X-r.png"),width: 30,height: 30,),
        leadingWidth: 80,
        title: Text(
          'Multiple Choice',
          style: getTextStyle(
              18, FontWeight.bold, textColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: Get.height,
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 6 / 5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemCount: 12,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grayScaleColor),
                        borderRadius: BorderRadius.circular(16),
                        color: grayScaleLineColor
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage(
                            ImageLocation.test_images + "/Camera-r.png"),width: 90,height: 60,),
                        SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                          child: Text(
                            'Multiple Choice',
                            style: getTextStyle(
                                16, FontWeight.bold, null),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            /*SingleChildScrollView(
              child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 16,bottom: 16),
                   child: Row(
                     children: [
                       SizedBox(
                         width: 16,
                       ),
                       Image(image: AssetImage(
                           ImageLocation.test_images + "/X-r.png"),width: 30,height: 30,),
                       SizedBox(
                         width: Get.width * .20,
                       ),
                       Text(
                         'Multiple Choice',
                         style: getTextStyle(
                             18, FontWeight.bold, null),
                         textAlign: TextAlign.center,
                       ),

                     ],
                   ),
                 ),
                 SizedBox(
                   height: 12,
                 ),
                 Row(
                   children: [
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(left: 12,right: 6),
                         padding: EdgeInsets.symmetric(vertical: 14),
                         decoration: BoxDecoration(
                             border: Border.all(color: grayScaleColor),
                             borderRadius: BorderRadius.circular(16),
                             color: grayScaleLineColor
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image: AssetImage(
                                 ImageLocation.test_images + "/Camera-r.png"),width: 90,height: 60,),
                             SizedBox(
                               width: 8,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                               child: Text(
                                 'Multiple Choice',
                                 style: getTextStyle(
                                     16, FontWeight.bold, null),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(left: 6,right: 12),
                         padding: EdgeInsets.symmetric(vertical: 14),
                         decoration: BoxDecoration(
                             border: Border.all(color: grayScaleColor),
                             borderRadius: BorderRadius.circular(16),
                             color: grayScaleLineColor
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image: AssetImage(
                                 ImageLocation.test_images + "/Camera-r.png"),width: 90,height: 60,),
                             SizedBox(
                               width: 8,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                               child: Text(
                                 'Multiple Choice',
                                 style: getTextStyle(
                                     16, FontWeight.bold, null),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 12,
                 ),
                 Row(
                   children: [
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(left: 12,right: 6),
                         padding: EdgeInsets.symmetric(vertical: 14),
                         decoration: BoxDecoration(
                             border: Border.all(color: grayScaleColor),
                             borderRadius: BorderRadius.circular(16),
                             color: grayScaleLineColor
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image: AssetImage(
                                 ImageLocation.test_images + "/Camera-r.png"),width: 90,height: 60,),
                             SizedBox(
                               width: 8,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                               child: Text(
                                 'Multiple Choice',
                                 style: getTextStyle(
                                     16, FontWeight.bold, null),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(left: 6,right: 12),
                         padding: EdgeInsets.symmetric(vertical: 14),
                         decoration: BoxDecoration(
                             border: Border.all(color: grayScaleColor),
                             borderRadius: BorderRadius.circular(16),
                             color: grayScaleLineColor
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image: AssetImage(
                                 ImageLocation.test_images + "/Camera-r.png"),width: 90,height: 60,),
                             SizedBox(
                               width: 8,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                               child: Text(
                                 'Multiple Choice',
                                 style: getTextStyle(
                                     16, FontWeight.bold, null),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 12,
                 ),
                 Row(
                   children: [
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(left: 12,right: 6),
                         padding: EdgeInsets.symmetric(vertical: 14),
                         decoration: BoxDecoration(
                             border: Border.all(color: grayScaleColor),
                             borderRadius: BorderRadius.circular(16),
                             color: grayScaleLineColor
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image: AssetImage(
                                 ImageLocation.test_images + "/Camera-r.png"),width: 90,height: 60,),
                             SizedBox(
                               width: 8,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                               child: Text(
                                 'Multiple Choice',
                                 style: getTextStyle(
                                     16, FontWeight.bold, null),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(left: 6,right: 12),
                         padding: EdgeInsets.symmetric(vertical: 14),
                         decoration: BoxDecoration(
                             border: Border.all(color: grayScaleColor),
                             borderRadius: BorderRadius.circular(16),
                             color: grayScaleLineColor
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image: AssetImage(
                                 ImageLocation.test_images + "/Camera-r.png"),width: 90,height: 60,),
                             SizedBox(
                               width: 8,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                               child: Text(
                                 'Multiple Choice',
                                 style: getTextStyle(
                                     16, FontWeight.bold, null),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 12,
                 ),
                 Row(
                   children: [
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(left: 12,right: 6),
                         padding: EdgeInsets.symmetric(vertical: 14),
                         decoration: BoxDecoration(
                             border: Border.all(color: grayScaleColor),
                             borderRadius: BorderRadius.circular(16),
                             color: grayScaleLineColor
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image: AssetImage(
                                 ImageLocation.test_images + "/Camera-r.png"),width: 90,height: 60,),
                             SizedBox(
                               width: 8,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                               child: Text(
                                 'Multiple Choice',
                                 style: getTextStyle(
                                     16, FontWeight.bold, null),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(left: 6,right: 12),
                         padding: EdgeInsets.symmetric(vertical: 14),
                         decoration: BoxDecoration(
                             border: Border.all(color: grayScaleColor),
                             borderRadius: BorderRadius.circular(16),
                             color: grayScaleLineColor
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image: AssetImage(
                                 ImageLocation.test_images + "/Camera-r.png"),width: 90,height: 60,),
                             SizedBox(
                               width: 8,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                               child: Text(
                                 'Multiple Choice',
                                 style: getTextStyle(
                                     16, FontWeight.bold, null),
                                 textAlign: TextAlign.center,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 12,
                 ),
               ],
          ),
            ),*/
           ),
      ),
    );
  }
}
