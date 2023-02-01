import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/models/auth_credential_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase with ChangeNotifier {
  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveAuthCred(AuthCredDataModel cred) async {
    prefs = await SharedPreferences.getInstance();
    debugPrint('cred.accessToken-->${cred.accessToken}');
    await prefs.setString('accessToken', cred.accessToken!);
  }

  Future<bool> fetchAuthCred() async {
    String? accessToken = prefs.getString('accessToken');
    debugPrint("$accessToken--- accc");
    if (accessToken != null) {
      debugPrint('not nullll');
      return true;
    } else {
      return false;
    }
  }
}
