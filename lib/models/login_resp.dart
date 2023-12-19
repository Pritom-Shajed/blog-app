/// success : true
/// message : "Login SuccessFully"
/// bearer_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZDExNDhmMDYzOGRhNjJmYTZiMmQ4YTk0YzFiNDZkOGY5NzY3ZWNlMGM0M2I3YWUyNzNlYzA4OGJiOTUwZjE2NzRiNGE4ODk3NjU2YmRmYjgiLCJpYXQiOjE2MzU1ODk3MzQuMDQwNzU2LCJuYmYiOjE2MzU1ODk3MzQuMDQwNzYxLCJleHAiOjE2NjcxMjU3MzQuMDI0MzA5LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.jyMWozFpqHhNZLiBf7wqvl-r309fklfiFt3oi-s4z8BxO4Dz33WfbewF-5nGkBwiGvfX226x34OiUBxL8fruQWXOn-z-nQq01Bn4YJ5Dx8pMwhBmAGRpJ_l-aERTtwB_0V_ItHQs5RqyZvsbVza6PE6TafuepQ7e_yxtQ9OzoTPbgEaE0GQTt14wjRFXaGeSIR34X8jWnB61Mrg0r5KtXdnCGptGsLyE1BlhDB_OM8Ab9pwEoQBF4tr68_xFiN9ncOy6Ys0-sMeA72xOCNeY77k41Z6IEiVurc_ix5NCCJpNJou9_liOPyjiWMZBwxWFnE6Jw2bgOxX6oHa5xgn452mEjt5zxZd6OaDkcqxVLgu7VBrOXVJuohB_2wli7o92t22dlnM4tsf1tBqd9vfJswVWFQJz5L0wmExdB1bZHpFlg3hiXsZAdhjba6_lE1LQKkWl_kR2EfYmX_Mg_7uMM7SSvd1ld_PDN56Dn5yZvvGBjv4OFWIp_dADENRwyE5dOl_7W8R92yV6B_kicpNJX0Ir4P5W7Dx0L06inf1CEDRZrsfg6EIl1LGh__qHnEDuGVUQ4sUytXxrI3Rpy6L8RNzT22qUCw9eLLB4gfDrDZcKr71ipMDcR5A-lB9WyJ7QyuQRcthF4swcoOVDlPe5lwlE0zs81hhLmJ6_FQ02T6k"
///"user_role": "flat_owner",
class LoginResp {
  LoginResp.fromJson(dynamic json) {
    _bearerToken = json['bearer_token']??'';
    _userRole = json['user_role']??'';
  }
  String _bearerToken = "";
  String _userRole = "";

  String get bearerToken => _bearerToken;

  set bearerToken(String value) {
    _bearerToken = value;
  }

  String get userRole => _userRole;

  set userRole(String value) {
    _userRole = value;
  }
}