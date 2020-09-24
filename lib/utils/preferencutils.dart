import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/utils/utils.dart';

class PreferencUtils {
  static Future<String> getUserToken(String key, String value) async {
    var mySharedPreferences = await SharedPreferences.getInstance();
    return mySharedPreferences.getString(key);
  }

  static void setUserToken(String key, String value) async {
    var mySharedPreferences = await SharedPreferences.getInstance();
    mySharedPreferences.setString(key, value);
  }

  static void removeUserToken() async {
    var mySharedPreferences = await SharedPreferences.getInstance();
    mySharedPreferences.remove(Utils.accessToken);
  }
}
