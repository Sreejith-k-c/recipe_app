
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_config/app_config.dart';
import '../../../helper/api_helper.dart';

class AddRecipeService {
  static Future<dynamic> postRecipe(Map<String, dynamic> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(AppConfig.loginData);

    try {
      var encodedData = await ApiHelper.postData(
        endPoint: "recipe/add/",
        body: data,
        headers: {"Authorization": "Bearer $token"},
      );

      if (encodedData["status"] == 1) {
        return encodedData;
      } else {
        return encodedData;
      }
    } catch (e) {
      print(e);
      // You can handle errors here
      throw e;
    }
  }
}
