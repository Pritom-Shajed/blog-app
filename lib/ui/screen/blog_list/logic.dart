import 'package:get/get.dart';

import '../../../models/BlogListResponse.dart';
import '../../../repositories/all_repository.dart';
import '../../../style/text_style.dart';
import '../base_controller.dart';
import 'state.dart';

class BlogListLogic extends BaseController {
  final BlogListState state = BlogListState();

  @override
  void onReady() {
    _getBlogList();
  }
  void deleteBlog(int id) async {
    try{
      state.isLoading.value = true;
      var resp = await AllRepository.deleteBlog(id);
      state.isLoading.value = false;
      if(resp.message == 'success' ){
        _getBlogList();
        //showWhiteToast("${resp.message!.isNotEmpty?resp.message:"Something went wrong"}");
      }else{
        showSingleCustomDialogBox(Get.context!,'Error'.tr, "${resp.message!.isNotEmpty?resp.message:"Something went wrong"}",null,null,
            onConfirm: (){
              Get.back();
            });
      }
    }catch(e){
      state.isLoading.value = false;
      update();
      print('?????????????????');
      print(e.toString());
      showSingleCustomDialogBox(Get.context!,'Error'.tr, e.toString(),null,null,
          onConfirm: (){
            Get.back();
          });
    }
  }

  void _getBlogList() async {
    try{
      state.isLoading.value = true;
      var resp = await AllRepository.blogList();
      state.isLoading.value = false;
      if(resp.message == 'Success'){

        state.blogListResponse.value = resp;

        update();
      }else{

      }
    }catch(e){
      print('?????');
      print('error ${e.toString()}');
      state.isLoading.value = false;
      update();


    }
  }

  void getBlogItemList() async{
    executeNetworkRequest<BlogListResponse>(state, () async => await AllRepository.blogList(), (p0, message) async {
      if(p0 != null){
        state.blogListResponse.value = p0;
      }
      state.isLoading.value = false;
      update();
    },doOnLoading: (){
      state.isLoading.value = true;
      update();
    },doOnError: (){
      state.isLoading.value = false;
      update();
    });
  }
}
