import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../../../../models/note_model.dart';

class EditNoteState {
  EditNoteState() {
    ///Initialize variables
  }

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  List notes = [].obs;
  int id = -1;

  var title = ''.obs;
  var body = ''.obs;

  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> _searchNote = [];
  final TextEditingController _headLineController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String noteDate = DateFormat("dd-MM-yyyy hh:mm aaa").format(DateTime.now());
  final openBox = Hive.box('open_note');

  String modifiedDate = DateFormat("dd-MM-yyyy hh:mm aaa").format(DateTime.now());
}
