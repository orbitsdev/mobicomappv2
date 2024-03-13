import 'dart:convert';


import 'package:mobicom/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSharePreferences {
   late SharedPreferences _preferences;



   Future init() async =>   _preferences = await SharedPreferences.getInstance();

   Future setUser(name, value) async {
 

    await _preferences.setString(name, value);
  }
    readtUser(name) async {
      final String? action = _preferences.getString(name);
      
      return action;

   
  }

   String? getUser(String name) {
    final String? action = _preferences.getString(name);
     return action;
   
  }

  // static Future addUsers(User user) async {
  //   final idUsers = _preferences.getStringList(_keyUsers) ?? <String>[];
  //   final newIdUsers = List.of(idUsers)..add(user.id);

  //   await _preferences.setStringList(_keyUsers, newIdUsers);
  // }

  // static List<User> getUsers() {
  //   final idUsers = _preferences.getStringList(_keyUsers);

  //   if (idUsers == null) {
  //     return <User>[];
  //   } else {
  //     return idUsers.map<User>(getUser).toList();
  //   }
  // }
}