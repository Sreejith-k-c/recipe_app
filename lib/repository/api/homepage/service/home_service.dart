import 'dart:developer';

import 'package:recipe_app/repository/helper/api_helper.dart';

class HomeService {
  static Future<dynamic> fetchRecipe() async {
   try {
     var decodeData = await ApiHelper.getData(endPoint: "recipe/get-time-based-recipes/");
        return decodeData; 
   } catch (e) {
     log("$e");
   }
  }
}