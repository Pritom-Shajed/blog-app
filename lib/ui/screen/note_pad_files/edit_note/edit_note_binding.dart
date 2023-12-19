import 'package:get/get.dart';

import 'edit_note_logic.dart';

class EditNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditNoteLogic());
  }
}
