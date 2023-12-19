import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../../models/note_model.dart';
import '../../../../style/theme.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_style.dart';
import '../../../customWidgets/root_containers.dart';
import '../../dash_board/dash_board_binding.dart';
import '../../dash_board/dash_board_view.dart';
import 'create_note_logic.dart';

class CreateNotePage extends StatelessWidget {
  CreateNotePage({super.key, required this.onNewNoteCreated});
  final logic = Get.find<CreateNoteLogic>();
  final state = Get.find<CreateNoteLogic>().state;
  final Function(Note) onNewNoteCreated;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(
        Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.greenButton,
            title: Text('New Note'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final value = Note(
                  title: state.titleController.text,
                  body: state.bodyController.text,
                  modifiedTime: state.modifiedDate
              );

              Hive.box('open_note').add(value);
              print(value.title);
              Navigator.of(context).pop();
/*              if(state.titleController.text.isEmpty){
                return;
              }
              if(state.bodyController.text.isEmpty){
                return;
              }
                final note = Note(
                  body: state.bodyController.text,
                  title: state.titleController.text,
                  modifiedTime: state.modifiedDate
                );
                onNewNoteCreated(note);
              Navigator.of(context).pop();
                print(state.titleController.text);
                print(state.bodyController.text);*/

            },
            child: Icon(Icons.save),
          ),
          body: Container(
            //color: AppColors.colorPrimaryLight,
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                    color: colorPestLight,
                    child: TextFormField(
                    controller: state.titleController,
                    style: getTextStyle(
                    24, FontWeight.normal,
                    AppColors.tabSelectedColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: getTextStyle2(
                            24, FontWeight.normal,
                            AppColors.takaColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Container(
                      height: Get.height,
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                      color: lightGreen,
                      child: TextFormField(
                        controller: state.bodyController,
                        maxLines: 100,
                        style: getTextStyle(
                            16, FontWeight.normal,
                            AppColors.textAshBUttonColor),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write a Note . . .'
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //bottomNavigationBar: BottomNavBar(state: state),
        )
    );
  }
}
