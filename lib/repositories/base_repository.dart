import '../api/api_base_helper.dart';


abstract class BaseRepository{
  static final ApiBaseHelper _helper = ApiBaseHelper();
  ApiBaseHelper get helper => _helper;

   List<T> listFromJson<T>(List jsonList,T Function(dynamic json) func) {
    List<T> _lists = [];
    if(jsonList != null && jsonList is List) {
      for(int i = 0; i < jsonList.length; i++) {
        _lists.add(func.call(jsonList[i]));
      }
    }
    return _lists;
  }
}