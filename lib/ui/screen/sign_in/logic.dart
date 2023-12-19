import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/login_resp.dart';
import '../../../models/SignInResponse.dart';
import '../../../repositories/all_repository.dart';
import '../../../utils/PreferenceUtils.dart';
import '../../../utils/constansts.dart';
import '../base_controller.dart';
import '../blog_list/view.dart';
import '../test_ui/view.dart';
import 'state.dart';

class SignInLogic extends BaseController {
  final SignInState state = SignInState();


  @override
  void onReady() {
    super.onReady();
    state.emailAddressController.addListener(() {
      _formValidation();
    });
    state.passwordController.addListener(() {
      _formValidation();
    });
  }

  void _formValidation(){
    if(state.emailAddressController.text.isEmpty){
      state.isButtonEnable.value = false;
      return;
    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(state.emailAddressController.text)){
      state.isButtonEnable.value = false;
      return;
    }else if(state.passwordController.text.isEmpty){
      state.isButtonEnable.value = false;
      return;
    }
    state.isButtonEnable.value = true;
  }

  void loginApiCall() async {
    var emailAddress = state.emailAddressController.text;
    var password = state.passwordController.text;
    await PreferenceUtils.init();
    //var token = PreferenceUtils.getString("device_token");
    var token = PreferenceUtils.getString('token');
    executeNetworkRequest<SignInResponse>(state, () async =>await AllRepository.login(emailAddress, password,token), (p0,message){
      if(p0 != null){
        PreferenceUtils.init();
        //PreferenceUtils.setString('token', p0.bearerToken);
        //PreferenceUtils.setString('userRole', p0.userRole);
        Get.offAll(() => TestUiPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
      }
    });
  }

  void signInApiCall() async{
    await PreferenceUtils.init();

    try{
      state.isLoading.value = true;
      var resp = await AllRepository.userLogin(
          state.emailAddressController.text,
          state.passwordController.text,
      );
      state.isLoading.value = false;
      if(resp.message == 'Success'){
        var token = resp.data?.token ?? '';
        PreferenceUtils.setString(AppConstants.PREF_KEY_AUTH_TOKEN,token);
        Get.to(() => BlogListPage(), transition: Transition.native, duration: const Duration(milliseconds: 500), curve: Curves.easeInCubic);
      }else{

      }
    }catch(e){
      state.isLoading.value = false;

    }
  }

  void adminLogin() async{
    await PreferenceUtils.init();
    var token = PreferenceUtils.getString('token');
    executeNetworkRequest(state, () async => await authenticationRepository.adminLogin(state.emailAddressController.text, state.passwordController.text,token), (p0, message) async{
      if(p0 != null){
        PreferenceUtils.init();
        //save_token
        //PreferenceUtils.setString(AppConstants.PREF_KEY_AUTH_TOKEN, p0);
        Get.offAll(() => BlogListPage(), transition: Transition.native, duration: const Duration(milliseconds: 500), curve: Curves.easeInCubic);
      }

      //TODO(USER LOGGED IN,, DO FURTHER WORK)
    });
  }

  }

