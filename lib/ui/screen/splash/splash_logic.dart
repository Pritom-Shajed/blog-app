import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../utils/constansts.dart';
import '../base_controller.dart';
import '../dash_board/dash_board_binding.dart';
import '../dash_board/dash_board_view.dart';
import '../sign_in/view.dart';
import '../test_ui/view.dart';
import 'splash_state.dart';

class SplashLogic extends BaseController {
  final SplashState state = SplashState();

  @override
  void onReady() {
    super.onReady();
    _splashScreenTimer();
  }

  _splashScreenTimer(){
    Timer( const Duration(seconds: AppConstants.SPLASH_SCREEN_DURATION), () {
      //Get.offAll(() => DashBoardPage(), binding: DashBoardBinding(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
      //Get.offAll(() => TestUiPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
      Get.offAll(() => SignInPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
    });
  }
}
