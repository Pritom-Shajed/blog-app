import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../../models/note_model.dart';
import '../../style/theme.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../screen/note_pad_files/note_veiw/note_veiw_binding.dart';
import '../screen/note_pad_files/note_veiw/note_veiw_view.dart';

class NoteCard extends StatelessWidget {
   NoteCard({super.key, required this.note,required this.id, required this.onNoteDeleted});

  final Note note;
  final int id;
  final Function(int) onNoteDeleted;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(() =>
            NoteVeiwPage(note: note, index: id, onNoteDeleted: onNoteDeleted),
            binding: NoteVeiwBinding(),
            transition: Transition.native,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInCubic);
        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EditScreen()));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '◾ ${note.title}',
                style: getTextStyle(18, FontWeight.normal,  AppColors.takaColor),
              ),

              //Divider(thickness: 1, color: Color(0xffBCCCCCC)),
              Padding(
                padding: const EdgeInsets.only(left: 28,right: 12),
                child: Text(
                  note.body,
                  style: getTextStyle(12, FontWeight.normal, commentTextColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              //Divider(thickness: 1, color: Color(0xffBCCCCCC)),
              Align(
               alignment: Alignment.bottomRight,
                child: Text(
                  //'Edited: ${DateFormat('EEE MMM d, yyyy h:mm a').format(note.modifiedTime)}',
                  '◾ ${note.modifiedTime}',
                  style: getTextStyle(10, FontWeight.normal,  AppColors.ratingCountNumber),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}