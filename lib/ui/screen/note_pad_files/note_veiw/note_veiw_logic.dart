import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../models/note_model.dart';
import '../../base_controller.dart';
import 'note_veiw_state.dart';

class NoteVeiwLogic extends BaseController {
  final NoteVeiwState state = NoteVeiwState();

  @override
  void onReady() {
    super.onReady();
    //refreshItems ();
    state.id = Get.arguments[0];
    state.titleController.text = Get.arguments[1];
    state.bodyController.text = Get.arguments[2];
  }

  @override
  void dispose() {
    Hive.box('open_note').close();
    super.dispose();
  }


  void onNewNoteCreated(Note note){
    state.notes.add(note);
  }

  void refreshItems () {
    final data = state.openBox.keys.map((key){
      final item = state.openBox.get(key);
      return {
        "key": key,
        "title": item["title"],
        "content": item["content"],
        "noteDate" : item["noteDate"]
      };

    } ).toList();
    state.items = data.reversed.toList();
    print('____________${state.items.length}');

  }
}
