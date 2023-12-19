import 'package:get/get.dart';

import '../../../../models/note_model.dart';
import '../../base_controller.dart';
import 'create_note_state.dart';

class CreateNoteLogic extends BaseController {
  final CreateNoteState state = CreateNoteState();

  @override
  void onReady() {
    super.onReady();
    //refreshItems ();
    //print(state.notes.length);
    //print(state.notes);

  }

  @override
  void dispose() {
    state.titleController.dispose();
    state.bodyController.dispose();
    state.modifiedDate;
    super.dispose();
  }

  Future<void> createItem (Map<String, dynamic> newItem)async{
    await state.openBox.add(newItem);
    print('>>>>>>>>>>>${state.openBox.length}');
    refreshItems ();

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
