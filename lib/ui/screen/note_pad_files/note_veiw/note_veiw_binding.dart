import 'package:get/get.dart';

import 'note_veiw_logic.dart';

class NoteVeiwBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteVeiwLogic());
  }
}
