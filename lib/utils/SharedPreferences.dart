import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  static final String login = "login";
  static final String token = "token";
  static final String userName = "userName";
  static final String fullName = "fullName";
  static final String corporateId = "corporateId";
  static final String userId = "userId";
  static final String emailAddress = "emailAddress";

  static Future<String> getlogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(login) ?? '';
  }

  static Future<bool> setlogin(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(login, value);
  }

  static Future<String> gettoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(token) ?? '';
  }

  static Future<bool> settoken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(token, value);
  }

  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(userName) ?? '';
  }

  static Future<bool> setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(userName, value);
  }
  static Future<String> getFullName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(fullName) ?? '';
  }

  static Future<bool> setFullName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(fullName, value);
  }
  static Future<String> getCorporateId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(corporateId) ?? '';
  }

  static Future<bool> setCorporateId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(corporateId, value);
  }

  static Future<bool?> clearAllPreferncesData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(login);
    preferences.remove(token);
    preferences.clear();
    preferences.commit();
  }
}
