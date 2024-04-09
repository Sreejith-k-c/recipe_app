import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/app_config/app_config.dart';
import 'package:recipe_app/presentation/search_details_screen/view/widgets/search_single_itemscreen.dart';
import 'package:recipe_app/presentation/splashscreen/get_started.dart';
import 'package:recipe_app/presentation/user_profile/controller/user_profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences sharedPreferences;
  File? profilePic;

  fetchData() {
    Provider.of<UserProfileController>(context, listen: false).fetchUserAvatar();
    Provider.of<UserProfileController>(context, listen: false).fetchUserNameEmail();
    Provider.of<UserProfileController>(context, listen: false).fetchUSerRecipe();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> getProfilePic(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        profilePic = File(pickedImage.path);
      });
    }
  }

  Future<void> userLogout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(AppConfig.loginData, "");
    sharedPreferences.setBool(AppConfig.status, false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileController>(builder: (context, controller, _) {
      return controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: Icon(Icons.account_circle),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.usernameEmailModel.username ?? "",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          userLogout();
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => GetStarted()));
                        },
                        icon: Icon(
                          Icons.logout_rounded,
                          size: 30,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
              ///// body
              body: Column(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // profile photo
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: InkWell(
                              onLongPress: () {
                                //getProfilePic(ImageSource.gallery);
                              },
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(controller.isLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : controller.userAvatarModel.avatar ??
                                        "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //  following
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "following",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "299",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),

                              // followers
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "followers",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "200",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),

                              // posts

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "posts",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "20",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () =>
                          Provider.of<UserProfileController>(context, listen: false).fetchUSerRecipe(),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children: List.generate(
                            controller.recipeModel.data!.length,
                            (index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchSingleItemScreen(
                                            title: controller.recipeModel.data?[index].title,
                                            image: controller.recipeModel.data?[index].picture,
                                            ingredient: controller.recipeModel.data?[index].ingredients,
                                            prepare: controller.recipeModel.data?[index].procedure)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${controller.recipeModel.data?[index].picture ?? "https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg"}"))),
                                child: Center(
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
