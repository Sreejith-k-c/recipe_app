import 'dart:developer';

import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/helper/api_helper.dart';

class UserProfileService {
  static Future<dynamic> fetchUserAvatar() async {
    log("UserProfileService -> fetchUserAvatar()");
    try {
      var decodedData = await ApiHelper.getDataWithoutStatus(
          endPoint: "user/profile/avatar/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
