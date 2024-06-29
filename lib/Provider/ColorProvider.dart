
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorProvider extends ChangeNotifier{

  ThemeMode currentTheme = ThemeMode.dark;
  SharedPreferences? _preferences ;
  final String themeKey = 'theme';

  void changeTheme() {
    if (currentTheme == ThemeMode.dark)
    currentTheme = ThemeMode.light;
    else
      currentTheme = ThemeMode.dark;
    notifyListeners();
    saveTheme(currentTheme);
  }

  String getBackgroundImage(){
    return currentTheme == ThemeMode.dark ?"assets/images/darkBackground.png":
    "assets/images/main_background.png";
  }


  bool isDarkEnabled(){
    return currentTheme == ThemeMode.dark;
  }

  String? getTheme (){
    return _preferences!.getString(themeKey);
  }

  Future<void>saveTheme(ThemeMode themeMode)async{
    String themeValue = (themeMode == ThemeMode.light ? "light" : "dark");
    await _preferences!.setString(themeKey, themeValue);

  }

  loadSettingConfig()async{

    _preferences = await SharedPreferences.getInstance();
    String? themeMode = getTheme();
    if(themeMode!= null) {
      print("theme not null");
      currentTheme = themeMode == "light" ? ThemeMode.light : ThemeMode.dark;
    }
  }



}