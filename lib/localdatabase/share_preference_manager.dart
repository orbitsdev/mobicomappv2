
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager  {
  

  static final String _showOnBoardingKey = 'showOnBoarding';

  static Future<bool> getShowOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_showOnBoardingKey) ?? false;
  }

  static Future<bool> setShowOnBoarding(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_showOnBoardingKey, value);
  }


  
}