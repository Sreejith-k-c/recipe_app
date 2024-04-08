import 'dart:developer';

import 'package:recipe_app/repository/helper/api_helper.dart';

class DetailedCatogoryService {
  static Future<dynamic> fetchCatogorylist(tag) async {
    try {
      var decodeData = ApiHelper.getDataWithoutStatus(
          endPoint: "recipe/category-feed/?limit=5&start=0&tag=$tag");
      return decodeData;
    } catch (e) {
      log("$e");
    }
  }
}
