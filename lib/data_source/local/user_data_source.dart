import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soul_talk_clone/models/user_model.dart';

class UserDataSource extends GetxService {
  Future<void> saveUserToPreferences(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<UserModel?> getUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      try {
        final userMap = jsonDecode(userJson);
        if (userMap is Map<String, dynamic>) {
          return UserModel.fromMap(userMap);
        }
      } catch (e) {
        log(e.toString(), name: 'UserDataSource :: getUserFromPreferences');
      }
    }
    return null;
  }

  Future<void> clearUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
