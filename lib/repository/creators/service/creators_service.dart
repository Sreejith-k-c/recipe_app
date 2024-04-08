import 'dart:developer';

import 'package:recipe_app/repository/helper/api_helper.dart';

class CreatorsServiceScreen {
  static Future<dynamic> getCreatorsList()async{
    try{
      var decodedData = await ApiHelper.getData(endPoint: "followers/users");
      log("service=> " + decodedData.toString());
      if(decodedData!=null && decodedData['status']==1){
        log("Data fetched Successfully");
        return decodedData;
      }else{
        log("failed to fetch data: ${decodedData?['status']}");
        return decodedData;
      }
    }catch(e){
      log("Error fetching data: $e");
      return null;
    }
  }
}