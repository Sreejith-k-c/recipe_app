import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/presentation/login/loginpage.dart';
import 'package:recipe_app/repository/api/registration/service/registration_service.dart';

import '../../../app_config/app_config.dart';

class RegistrationController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  void onRegistration(
      BuildContext context, String uname, String email, String password) {
    var data = {"username": uname, "email": email, "password": password};
    RegistrationService.postRegistration(data).then((recData) {
      log("onRegistration ${recData["status"]}");

      if (recData["status"] == 1) {
        if (recData["msg"] == "Successfully Registered") {
          var message = recData["msg"];
          AppUtils.oneTimeSnackBar(message, context: context);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()));
          storeRecivedData(recData);
        } else {
          var message = recData["msg"];
          AppUtils.oneTimeSnackBar(message, context: context);
        }
      } else {
        var message = recData["msg"];
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }

  storeRecivedData(resData) async {
    log("storeRecivedData>>resData");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = json.encode(resData["data"]);
    sharedPreferences.setString(AppConfig.loginData, storeData);
  }
}
