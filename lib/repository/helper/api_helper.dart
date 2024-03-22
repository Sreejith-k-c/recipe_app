import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../app_config/app_config.dart';

class ApiHelper {
  // get method
  static getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper>getData");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    try {
      log("$url");
      var response = await http.get(url);
      log("ApiHelper>>Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log(decodedData.toString());
        var data = {
          "data": decodedData,
          "status": 1,
        };
        return data;
      } else {
        log("ApiHelper >> Else Condition >> Api failed");
        var data = {
          "data": null,
          "status": 0,
        };
        return data;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }
  static postData({
    required String endPoint,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    log("Api-helper>postData");
    log("$body");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("$url");
    try {
      var response = await http.post(url, body: body);
      log("ApiHelper>>Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else {
        log("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        var data = {
          "status": 0,
          "msg": "Failed",
          "data": decodedData
        };
        return data;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }


  //for post
  static postRegisterData({
    required String endPoint,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    log("Api-helper>postRegisterData");
    log("$body");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("$url");
    try {
      var response = await http.post(url, body: body);
      log("ApiHelper>>Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else if (response.statusCode == 400) {
        var decodedData = jsonDecode(response.body);
        var data = {
          "status": 0,
          "msg": "RegisteredUser Already Exist",
          "data": decodedData
        };
        return data;
      } else {
        log("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        var data = {
          "status": 0,
          "msg": "Failed",
          "data": decodedData
        };
        return data;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }
}
