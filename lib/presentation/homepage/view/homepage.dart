import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global_widget/recipe_details/recipe_details.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://tse2.explicit.bing.net/th?id=OIP.2BvoUsJNneeu_ALPbUmCHwHaLH&pid=Api&P=0&h=180",
            ),
          ),
        ),
        title: Text(
          "Welcome User",
          style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
        actions: [],
      ),
      body: FutureBuilder(
        future: Provider.of<HomeController>(context, listen: false).startFn(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<HomeController>(
              builder: (context, hController, child) {
                return ListView.builder(
                  itemCount: hController.homeModel.data?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetails(hController.homeModel.data?[index])));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListTile(
                              title: Text(
                                "${hController.homeModel.data?[index].name.toString()}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("${hController.homeModel.data?[index].totalTime.toString()}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "${hController.homeModel.data?[index].image.toString()}",
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _showCommentDialog(context);
                                    },
                                    icon: Icon(
                                      Icons.comment,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.bookmark_add_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  void _showCommentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your comment...',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
