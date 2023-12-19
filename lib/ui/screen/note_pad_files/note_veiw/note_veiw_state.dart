import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../../../models/note_model.dart';

class NoteVeiwState {
  NoteVeiwState() {
    ///Initialize variables
  }
  int? id;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  //var notes = Rx<List<Note>>([]);
  List notes = [].obs;
  //var titleNote = ''.obs;
  //var bodyNote = ''.obs;


  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> searchNote = [];
  final TextEditingController headLineController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String noteDate = DateFormat("dd-MM-yyyy hh:mm aaa").format(DateTime.now());
  final openBox = Hive.box('open_note');

}
