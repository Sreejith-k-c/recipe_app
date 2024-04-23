import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/creators/controller/creators_controller.dart';
import 'package:recipe_app/presentation/user_profile/controller/user_profile_controller.dart';

class FollowerListScreen extends StatefulWidget {
  const FollowerListScreen({super.key});

  @override
  State<FollowerListScreen> createState() => _FollowerListScreenState();
}

class _FollowerListScreenState extends State<FollowerListScreen> {
  fetchData() {
    Provider.of<CreatorsController>(context, listen: false);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Followers',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      ),
      body: Consumer<UserProfileController>(builder: (context, controller, child) {
        return ListView.builder(
          itemCount: ,
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    // leading: const CircleAvatar(
                    //   maxRadius: 50,
                    //   //minRadius: 40,
                    //   backgroundImage:
                    //       AssetImage("recipe_app/assets/images/userimage3.jpg"),
                    // ),
                    title: Text(""
                    ),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Following',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
