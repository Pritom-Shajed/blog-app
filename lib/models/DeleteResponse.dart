/// message : "Blog Delete Success"
/// status : 1

class DeleteResponse {
  DeleteResponse({
      String? message, 
      num? status,}){
    _message = message;
    _status = status;
}

  DeleteResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
  }
  String? _message;
  num? _status;
DeleteResponse copyWith({  String? message,
  num? status,
}) => DeleteResponse(  message: message ?? _message,
  status: status ?? _status,
);
  String? get message => _message;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}