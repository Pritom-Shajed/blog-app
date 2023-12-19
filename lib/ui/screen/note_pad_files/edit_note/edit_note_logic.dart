import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../models/note_model.dart';
import '../../base_controller.dart';
import '../note_veiw/note_veiw_binding.dart';
import '../note_veiw/note_veiw_view.dart';
import 'edit_note_state.dart';

class EditNoteLogic extends BaseController {
  final EditNoteState state = EditNoteState();

  @override
  void onReady() {
    super.onReady();
    state.title.value = Get.arguments[0];
    state.body.value = Get.arguments[1];
   // state.id = Get.arguments[2];
    setInitialData();
  }

  setInitialData(){
    state.titleController.text = state.title.value;
    state.bodyController.text = state.body.value;
    update();
  }
//
  Future<void> createItem (Map<String, dynamic> newItem)async{
    await state.openBox.add(newItem);
    print('>>>>>>>>>>>${state.openBox.length}');
    refreshItems ();

  }

  Future<void> editItem (int itemKey,Map<String, dynamic> item)async{
    await state.openBox.put(itemKey, item);
    print('>>>>>>>>>>>${state.openBox.length}');
    refreshItems ();

  }

  Future<void> deleteItem (int itemKey)async{
    await state.openBox.delete(itemKey);
    print('>>>>>>>>>>>${state.openBox.length}');
    refreshItems ();

  }

  void refreshItems () {
    final data = state.openBox.keys.map((id){
      final item = state.openBox.get(id);
      return    {
        "title": item["title"],
        "body": item["body"],
        "modifiedTime" : item["modifiedTime"]
      };;

    } ).toList();
      state.notes = data.reversed.toList();
      print('____________${state.items.length}');

  }
//
  void onNoteCreated(Note note) async{
    await state.openBox.add(note);
    print('>>>>>>>>>>>${state.openBox.length}');
    refreshItems ();
    state.notes.add(note);
  }

  void onNoteUpdate(Note note){
    state.notes.add(note);
  }

  @override
  void initState() {

  }
}
