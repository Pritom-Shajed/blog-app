import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../../../../models/note_model.dart';

class CreateNoteState {
  CreateNoteState() {
    ///Initialize variables
  }

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  ////
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> searchNote = [];
  final TextEditingController headLineController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String modifiedDate = DateFormat("dd-MM-yyyy hh:mm aaa").format(DateTime.now());
  final openBox = Hive.box('open_note');
  //List<Note> notes = [].obs as List<Note>;
  //var notes = Rx<List<Note>>([]);
}
