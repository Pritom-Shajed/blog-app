import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/note_model.dart';
import '../../../../style/theme.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_style.dart';
import '../note_veiw/note_veiw_binding.dart';
import '../note_veiw/note_veiw_view.dart';
import 'edit_note_logic.dart';

class EditNotePage extends StatelessWidget {
  final logic = Get.find<EditNoteLogic>();
  final state = Get.find<EditNoteLogic>().state;
  //final Function(Note) onNewNoteCreated;

  EditNotePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenButton,
        title: Text('Edit Note'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(state.titleController.text.isEmpty){
            return;
          }
          if(state.bodyController.text.isEmpty){
            return;
          }
          final note = Note(
            title: state.titleController.text,
            body: state.bodyController.text,
              modifiedTime: state.modifiedDate
          );
        /*  Get.offAll(() =>
              NoteVeiwPage(note: note, index: state.id, onNoteDeleted: (p0) {
              } ),
              binding: NoteVeiwBinding(),
              transition: Transition.native,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInCubic);*/
          //onNewNoteCreated(note);
          logic.onNoteCreated(note);
          Navigator.of(context).pop();
          print(state.titleController.text);
          print(state.bodyController.text);


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
                    hintText: '',
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
                        hintText: ''
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavBar(state: state),
    );
  }
}
