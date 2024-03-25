import 'package:recipe_app/repository/helper/api_helper.dart';

class LoginService{
  static Future<dynamic> postLogin(Map<String, String> data) async{
    try{
      var encodedData=
      await ApiHelper.postData(endPoint: "user/login/", body: data);
     // var message=encodedData["msg"];
      if(encodedData["status"]==1) {
        return encodedData;
      }else{
        return encodedData;
      }
    }catch(e){
      print(e);
    }
  }
}