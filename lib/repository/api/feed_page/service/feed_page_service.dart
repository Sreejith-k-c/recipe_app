import 'dart:developer';

import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/helper/api_helper.dart';

class FeedPageService {
  static Future<dynamic> fetchData() async {
    try {
      var decodeData = await ApiHelper.getData(
          endPoint: "recipe/feed/", header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodeData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> likedItem(id) async {
    try {
      var decodedData = ApiHelper.postLike(
          endPoint: "recipe/$id/like/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> onUnlike(id) async {
    try {
      var decodedData = ApiHelper.delete(
          endPoint: "recipe/$id/like/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> fetchComments(id) async {
    try {
      var decodedData = ApiHelper.getDataWithoutStatus(
          endPoint: "recipe/$id/comment/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
