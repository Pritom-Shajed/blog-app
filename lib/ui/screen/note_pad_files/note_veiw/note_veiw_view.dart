import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/ui/screen/dash_board/dash_board_view.dart';
import '../../../../models/note_model.dart';
import '../../../../style/theme.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_style.dart';
import '../edit_note/edit_note_binding.dart';
import '../edit_note/edit_note_view.dart';
import 'note_veiw_logic.dart';
import '../../base_controller.dart';

class NoteVeiwPage extends StatelessWidget {
  final logic = Get.find<NoteVeiwLogic>();
  final state = Get
      .find<NoteVeiwLogic>()
      .state;
  final Note note;
  final int index;
  final Function(int) onNoteDeleted;

  NoteVeiwPage

  ({super.key, required this.note, required this.index, required this.onNoteDeleted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
        backgroundColor: AppColors.tabSelectedColor,

        actions: [
          IconButton(
            onPressed: () {
              showCustomDialogBox(Get.context!, "Delete This ?",
                  "Note ${note.title} will be deleted!", null, null,
                  onConfirm: () {
                    Navigator.of(context).pop();
                    onNoteDeleted(index);
                    Navigator.of(context).pop();
                  },
                  onCancel: () {
                    Get.back();
                  });
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => EditNotePage(),
              binding: EditNoteBinding(),
              arguments: [note.title, note.body, index],
              transition: Transition.native,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInCubic);
        },
        child: const Icon(Icons.edit),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        color: colorPestLight,
        height: Get.height,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '◾ ${note.title}',
                    //'◾◾ ${state.items[index]["title"]}',
                    style: getTextStyle(20, FontWeight.normal, Colors.black),
                  ),
                  Divider(thickness: 1, color: Color(0xffBCCCCCC)),
                  SizedBox(height: 10,),
                  Text(
                    note.body,
                    // state.items[index]["content"],
                    style: getTextStyle(16, FontWeight.normal, greyTextColor),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showCustomDialogBox(BuildContext context, String title, String errors,
    String? leftButtonText, String? rightButtonText,
    {required VoidCallback onConfirm, required VoidCallback onCancel}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext cxt) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Material(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: getTextStyle2(
                      20, FontWeight.bold, AppColors.tabSelectedColor),),
                  SizedBox(height: 20,),
                  Text(errors,
                    style: getTextStyle2(14, FontWeight.normal, Colors.black),),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: onCancel,
                          child: Container(
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              height: 50,
                              child: Center(child: Text(
                                leftButtonText ?? 'Back'.tr,
                                style: getTextStyle2(
                                    14, FontWeight.bold, Colors.white),))
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: onConfirm,
                          child: Container(
                              decoration: BoxDecoration(
                                color: colorAccentLight,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                ),
                              ),
                              height: 50,
                              child: Center(child: Text(
                                rightButtonText ?? 'Okay'.tr,
                                style: getTextStyle2(
                                    14, FontWeight.bold, Colors.white),))
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
