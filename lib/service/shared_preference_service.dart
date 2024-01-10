import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {

  saveToken(String value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', value);
  }

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

  deleteToken() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
  }
}