import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';

class AddRecipeController extends ChangeNotifier {
  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tokenJsonString = sharedPreferences.getString(AppConfig.loginData);
    if (tokenJsonString != null) {
      Map<String, dynamic> tokenData = jsonDecode(tokenJsonString);
      String? accessToken = tokenData['tokens']['access'];
      return accessToken;
    }
    return null;
  }

  void onRecipeAdd({
    required String categoryName,
    required String title,
    required String desc,
    File? image,
    required String cookTime,
  }) async {
    try {
      String? accessToken = await getAccessToken();

      if (accessToken != null) {
        var imageUrl = "${AppConfig.baseurl}recipe/create/";
        onUpload(
          imageUrl,
          image,
          categoryName,
          title,
          desc,
          cookTime,
          accessToken,
        ).then((value) {
          if (value.statusCode == 201) {
            log("on upload${value.statusCode}");
            var data = jsonDecode(value.body);
            log("$data");
            log("Added Successfully");
          } else {
            log("FAILED TO UPLOAD");
          }
        });
      } else {
        log("access token is null");
      }
    } catch (e) {
      log("$e");
    }
  }

  Future<http.Response> onUpload(
    String url,
    File? selectedImage,
    String categoryName,
    String title,
    String desc,
    String cookTime,
    String accessToken,
  ) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {
      "Content-type": "multipart/form-data",
      // 'Accept': 'application/json',
      "Authorization": "Bearer $accessToken"
    };

    if (selectedImage != null) {
      print("Image file size: ${selectedImage.lengthSync()} bytes <<<<<<<<<<<");
      print(" Access Token: $accessToken");

      request.files.add(
        await http.MultipartFile.fromPath(
          'picture',
          selectedImage.path,
        ),
      );
    }
    request.fields['picture'] = selectedImage!.path;
    request.fields['category_name'] = categoryName;
    request.fields['title'] = title;
    request.fields['desc'] = desc;
    request.fields['cook_time'] = cookTime;
    request.headers.addAll(headers);

    print("Request URL>>>>>: $url");
    print("Request Headers>>>>>>>: $headers");
    print("Request Body: ${request.fields},Files>>>> ${request.files}");

    var res = await request.send();
    print("Response:>>>>>> ${res.statusCode}->>>>>> ${res.reasonPhrase}");
    return await http.Response.fromStream(res);
  }
}








/*

      if (response.statusCode == 200 || response.statusCode == 201) {
        var imageUrlFromServer = json.decode(response.body)["picture"];
        String constructImageUrl() {
          return '${AppConfig.mediaUrl}$imageUrlFromServer';
        }
        var data = {
          "category_name": categoryName,
          "title": title,
          "desc": desc,
          "cook_time": cookTime,
          // "picture": {AppConfig.mediaUrl},
          "picture": constructImageUrl(),
        };

        var decodedData = await AddRecipeService.postRecipe(data);

        // if (response.statusCode == 201) {
        if (decodedData["status"] == 1) {
          print(" Decodedd data ------${decodedData.toString()}");
          print("Recipe posted Successfully///////");
          print("Success status>>> ${response.statusCode}");
        } else {
          var message = "Error in API";
          print(message);
        }
      } else {
        print("Image upload failed with status code: ${response.statusCode}");
      }
    } else {
      print("Access token not found");
    }
    } catch (e) {
      print("Error occurred: $e");
    }
 */
