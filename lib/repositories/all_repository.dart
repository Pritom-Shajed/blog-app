import '../api/api_base_helper.dart';
import '../config/server_addresses.dart';
import '../models/BlogListResponse.dart';
import '../models/DeleteResponse.dart';
import '../models/base_response.dart';
import '../models/login_req.dart';
import '../models/login_resp.dart';
import '../utils/PreferenceUtils.dart';
import '../models/SignInResponse.dart';
import 'base_repository.dart';

class AllRepository extends BaseRepository{
  static ApiBaseHelper _helper = ApiBaseHelper();


  static Future<BaseResponse<LoginResp>> login(String number, String password, String token) async{
    Map<String, dynamic> req = {"email": number, "password":password, "token": token};
    final response = await _helper.post(ServerAddresses.userLogin,req);
    return BaseResponse<LoginResp>.fromJson(response, build: (p0) => LoginResp.fromJson(p0["response"]));
  }

  static Future<SignInResponse> signIn(String email, String password) async{
    var request = {'email':email,'password':password};
    final response = await _helper.post(ServerAddresses.userLogin,request);
    return SignInResponse.fromJson(response);
  }

  static Future<SignInResponse> loginApi(LoginReq req) async{
    //Map<String, dynamic> req = {"username": userName, "password": password, };
    final response = await _helper.post(ServerAddresses.userLogin,req.toJson() );
    return SignInResponse.fromJson(response);
  }

  static Future<SignInResponse> userLogin(String email,String password) async{
    Map<String, dynamic> req = {"email": email,"password":password};
    final response = await _helper.post(ServerAddresses.userLogin,req);
    return SignInResponse.fromJson(response);
  }
//getBlogList
  static Future<BlogListResponse> blogList() async{
    PreferenceUtils.init();
    final response = await _helper.get(ServerAddresses.blogList,token:'Bearer');
    return BlogListResponse.fromJson(response);
  }

//sign_in
  Future<SignInResponse> adminLogin(String email,String password, String token) async{
    Map<String, dynamic> req = {"email": email,"password":password ,'token':token};
    final response = await helper.post(ServerAddresses.userLogin,req);
    return SignInResponse.fromJson(response);
  }

//delete api :
  static Future<DeleteResponse> deleteBlog(int id) async{
    Map<String,dynamic> req = {'id':id};
    final response = await _helper.delete('/api/admin/blog-news/delete/$id',req,token: 'Bearer');
    return DeleteResponse.fromJson(response);
  }

}