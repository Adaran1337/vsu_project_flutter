import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vsu_project/dto/http/auth/jwt_token.dart';
import 'package:vsu_project/dto/http/auth/login_user_request.dart';
import 'package:vsu_project/dto/http/auth/register_user_request.dart';
import 'package:vsu_project/service/shared_preference_service.dart';
import 'package:vsu_project/utils/api_utils.dart';

class AuthenticationService {

  register(RegisterUserRequest request) async {
    await _requestToken(ApiUtils.register, request);
  }

  login(LoginUserRequest request) async {
    await _requestToken(ApiUtils.login, request);
  }

  logout() {
    SharedPreferenceService().deleteToken();
  }

  _requestToken(String uri, Object dto) async {
    final response = await http.post(
      Uri.parse(uri),
      body: jsonEncode(dto),
      headers: {'Content-type': 'application/json', 'Accept': '*/*'},
    );

    if (response.statusCode != 200) {
      throw Exception('Введены неверные учётные данные');
    }

    final token = _parseToken(response);
    _saveTokenToPreference(token);
  }

  JwtToken _parseToken(http.Response response) {
    final jwtTokenJson = jsonDecode(response.body);
    final jwtToken = JwtToken.fromJson(jwtTokenJson);
    return jwtToken;
  }

  _saveTokenToPreference(JwtToken jwtToken) {
    SharedPreferenceService().saveToken(jwtToken.token);
  }
}
