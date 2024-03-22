import 'package:flutter/material.dart';
import 'package:recipe_app/repository/api/login/service/login_service.dart';
import '../../../core/app_utils.dart';
import '../../bottom_navigation/bottom_navigation_bar.dart';

class LoginController extends ChangeNotifier {
  void onLogin(BuildContext context, String email, String password) {
    var data = {
      "email": email, "password": password
    };
     LoginService.postLogin(data).then((recData){

      if(recData["status"]==1){
        var data=recData["data"];
        var message=recData["msg"];
        AppUtils.oneTimeSnackBar(message, context: context);
        // if(data[""]=="Successfully Login"){
        //   var message=recData["msg"];
        //   AppUtils.oneTimeSnackBar(message,context:context);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => BottomNav()));
        // }else{
        //   var message=recData["msg"];
        //   AppUtils.oneTimeSnackBar(message,context:context);
        // }
      }else{
        var message = recData["msg"];
        AppUtils.oneTimeSnackBar(message, context: context);
      }
     });
  }
}
