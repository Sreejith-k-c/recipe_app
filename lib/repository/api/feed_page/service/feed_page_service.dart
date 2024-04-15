import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/helper/api_helper.dart';

class FeedPageService {
  static Future<dynamic> fetchData() async {
    try {
      var decodeData = await ApiHelper.getData(
          endPoint: "recipe/feed/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodeData;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> likedItem(id) async{
    var data={};
    var decodedData=ApiHelper.postData(endPoint: "recipe/$id/like/", header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()) );
  }
}
