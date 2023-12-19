import 'package:get/get.dart';

import 'dash_board_logic.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardLogic());
  }
}
