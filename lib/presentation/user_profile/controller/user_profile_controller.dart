import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipe_app/repository/api/common_model/recipe_model.dart';
import 'package:recipe_app/repository/api/user_profile/model/user_avatar_model.dart';
import 'package:recipe_app/repository/api/user_profile/model/username_email_model.dart';
import 'package:recipe_app/repository/api/user_profile/service/user_profile_service.dart';

class UserProfileController extends ChangeNotifier {
  UserAvatarModel userAvatarModel = UserAvatarModel();
  UsernameEmailModel usernameEmailModel = UsernameEmailModel();
  RecipeModel recipeModel = RecipeModel();
  bool isLoading = false;
  bool isLoading2 = false;

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

  fetchUserNameEmail() async {
    log("UserProfileController -> fetchUserNameEmail()");
    UserProfileService.fetchUserNameEmail().then((value) {
      if (value["status"] == 1) {
        usernameEmailModel = UsernameEmailModel.fromJson(value["data"]);
      } else {}
      notifyListeners();
    });
  }

  fetchUSerRecipe() async {
    log("UserProfileController -> fetchUSerRecipe()");
    UserProfileService.fetchUserRecipe().then((value) {
      if (value["status"] == 1) {
        recipeModel = RecipeModel.fromJson(value);
      } else {}
      notifyListeners();
    });
  }
}
