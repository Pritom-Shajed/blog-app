import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/note_model.dart';
import '../base_states.dart';

class DashBoardState extends BaseState {
  TextEditingController searchController = new TextEditingController(text: '');
  DashBoardState() {
    ///Initialize variables
  }

  final hiveBox = Hive.box('open_note');
  int selectedIndex = 0;
  List notes = [].obs;
  List note = Note as List;
}
