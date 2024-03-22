import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/presentation/login/view/loginpage.dart';
import 'package:recipe_app/repository/api/registration/service/registration_service.dart';


class RegistrationController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  void onRegistration(
      BuildContext context, String uname, String email, String password) {
    var data = {"username": uname, "email": email, "password": password};
    RegistrationService.postRegistration(data).then((recData) {
      log("onRegistration ${recData["status"]}");

      if (recData["status"] == 1) {
        var message = recData["msg"];
          AppUtils.oneTimeSnackBar(message,txtColor: Colors.green, context: context);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()));
          
        
      } else {
        if (recData["msg"] != "Failed") {
          var message = recData["msg"];
          AppUtils.oneTimeSnackBar(message, txtColor: Colors.red,context: context);
        } else {
          var message = recData["msg"];
          AppUtils.oneTimeSnackBar(message, txtColor: Colors.red,context: context);
        }
      }
    });
  }

  
}
