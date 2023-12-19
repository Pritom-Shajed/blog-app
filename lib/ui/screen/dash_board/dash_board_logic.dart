import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/note_model.dart';
import '../base_controller.dart';
import 'dash_board_state.dart';

class DashBoardLogic extends BaseController {
  final DashBoardState state = DashBoardState();

  void onItemTapped(int index) {
      state.selectedIndex = index;
      update();
  }
  @override
  void onReady() {
    super.onReady();
    //state.notes = Get.arguments[0];
    print(hiveBox.length);
    print('ssssssssss');
    if (kDebugMode) {
      print(state.notes.length);
      print('oooooooooooooooooooooooooo');
    }

  }

  final hiveBox = Hive.box('open_note');
  @override
  void dispose() {
    Hive.box('open_note').close();
    //or
    //Close all boxes
    // Hive.close();
    super.dispose();
  }
  void launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void onNewNoteCreated(Note note){
    state.notes.add(note);
  }

  void onNoteDeleted(int index){
    state.notes.removeAt(index);

  }

  void onSearchTextChanged(String searchText) {

  }

}
