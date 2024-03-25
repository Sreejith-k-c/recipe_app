import 'package:flutter/material.dart';

import '../../../repository/api/add_recipe/service/add_recipe_service.dart';

class AddRecipeController extends ChangeNotifier {
  void onRecipeAdd(String categoryName, String title, String desc) {
    var data = {
      "category": categoryName,
      "title": title,
      "desc": desc,
      // "cook_time": cookTime,
      // "ingredients": [], // You can add ingredients here if needed
      // "procedure": [], // You can add procedure steps here if needed
    };

    AddRecipeService.postRecipe(data).then((recData) {
      // Handle response from service if needed
    });
  }
}
