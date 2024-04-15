import 'dart:convert';
import 'dart:developer';

import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/helper/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';

class CreatorsServiceScreen {
  static Future<dynamic> getCreatorsList() async {
    try {
      var decodedData = await ApiHelper.getData(endPoint: "followers/users");
      log("service=> " + decodedData.toString());
      if (decodedData != null && decodedData['status'] == 1) {
        log("Data fetched Successfully");
        return decodedData;
      } else {
        log("failed to fetch data: ${decodedData?['status']}");
        return decodedData;
      }
    } catch (e) {
      log("Error fetching data: $e");
      return null;
    }
  }

  static followUser(Map<String, dynamic> data) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String? token = sharedPreferences.getString(AppConfig.loginData);

    // Future<String?> getAccessToken() async {
    //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //   String? tokenJsonString = sharedPreferences.getString(AppConfig.loginData);
    //   if (tokenJsonString != null) {
    //     Map<String, dynamic> tokenData = jsonDecode(tokenJsonString);
    //     String? accessToken = tokenData['tokens']['access'];
    //     return accessToken;
    //   }
    //   return null;
    // }
    try {
      // String? accessToken = await getAccessToken();
      var decodedData = await ApiHelper.postData(
          endPoint: "followers/follow/",
          body: data,
          // headers: {"Authorization": "Bearer $accessToken"}
      header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()) );
      log("service=>>>>>>>>>>> " + decodedData.toString());
      if (decodedData['status'] == 1) {
        log("Follow success");
        return decodedData;
      } else {
        log("folow fail >>>>>: ${decodedData?['status']}");
        return decodedData;
      }
    } catch (e) {
      log("fail >>>>>>: $e");
      return null;
    }
    // try{
    //   var decodedData= await ApiHelper.postData(endPoint: "followers/follow/", body: data, headers: {"Authorization": "Bearer $token"});
    //   return decodedData;
    // }catch (e){
    //   return null;
    // }
  }
}
