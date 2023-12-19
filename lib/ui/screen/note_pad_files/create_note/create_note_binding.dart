import 'package:get/get.dart';

import 'create_note_logic.dart';

class CreateNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateNoteLogic());
  }
}
