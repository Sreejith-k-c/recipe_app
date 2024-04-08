import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/creators/model/creators_model.dart';
import 'package:recipe_app/repository/creators/service/creators_service.dart';

class CreatorsController with ChangeNotifier {
  CreatorsModel creatorsModel = CreatorsModel();
  bool isLoading = false;

  fetchCreatorsList(context) async {
    isLoading = true;
    notifyListeners();
    CreatorsServiceScreen.getCreatorsList().then((value) {
      if (value["status"] == 1) {
        log("AllCategoriesScreenController -> AllCategoriesServiceScreen -> data -> ${value["data"]}");
        creatorsModel = CreatorsModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }
}
