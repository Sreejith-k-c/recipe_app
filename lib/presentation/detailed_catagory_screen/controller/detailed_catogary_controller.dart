import 'package:flutter/material.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/api/detailed_catagory_screen/model/detailed_catogory_model.dart';

import '../../../repository/api/detailed_catagory_screen/service/detailed_catogory_service.dart';

class DetailedCatogoryController extends ChangeNotifier {
  bool isLoading = false;
  DetailedCatagoryModel detailedCatagoryModel = DetailedCatagoryModel();

  fetchData(BuildContext context, tag) {
    isLoading = true;
    notifyListeners();
    DetailedCatogoryService.fetchCatogorylist(tag).then((resData) {
      if (resData["status"] == 1) {
        detailedCatagoryModel = DetailedCatagoryModel.fromJson(resData);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("Failed", context: context);
      }
      notifyListeners();
    });
  }
}
