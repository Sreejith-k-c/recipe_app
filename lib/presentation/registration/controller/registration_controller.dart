import 'package:flutter/src/widgets/framework.dart';
import 'package:recipe_app/repository/api/registration/service/registration_service.dart';

class RegistrationController {
  void onRegistration(
      BuildContext context, String uname, String email, String password) {
    var data = {"username": uname, "email": email, "password": password};
   RegistrationService.postRegistration(data).then((recData) {
    
   } );
  }
}
