import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipe_app/core/app_utils.dart';

import '../../../repository/api/feed_page/model/feed_page_model.dart';
import '../../../repository/api/feed_page/service/feed_page_service.dart';

class FeedPageController extends ChangeNotifier {
  bool isLoading = false;
  FeedModel feedModel = FeedModel();

  void fetchFeed(BuildContext context) {
    isLoading = true;
    notifyListeners();
    FeedPageService.fetchData().then((value) {
      if (value["status"] == 1) {
        feedModel = FeedModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("Fetching Failed", context: context, bgColor: Colors.red);
      }
      notifyListeners();
    });
  }

  void likeTapped(id, context) {
    FeedPageService.likedItem(id).then((value) {
      log("================$value");
      if (value["status"] == 1) {
        AppUtils.oneTimeSnackBar(value["message"], context: context);
      } else {
        AppUtils.oneTimeSnackBar(value["message"], context: context,bgColor: Colors.redAccent);
      }

    });
  }
}
