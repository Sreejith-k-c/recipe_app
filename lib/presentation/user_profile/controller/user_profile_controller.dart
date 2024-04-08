import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipe_app/repository/api/user_profile/model/user_avatar_model.dart';
import 'package:recipe_app/repository/api/user_profile/service/user_profile_service.dart';

class UserProfileController extends ChangeNotifier {
  UserAvatarModel userAvatarModel = UserAvatarModel();
  bool isLoading = false;

  fetchUserAvatar() async {
    isLoading = true;
    notifyListeners();
    log("UserProfileController -> fetchUserAvatar()");
    UserProfileService.fetchUserAvatar().then((value) {
      if (value["status"] == 1) {
        userAvatarModel = UserAvatarModel.fromJson(value["data"]);
        isLoading = false;
      } else {}
      notifyListeners();
    });
  }
}
