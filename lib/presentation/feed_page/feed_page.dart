import 'package:flutter/material.dart';
import 'package:recipe_app/global_widget/feed_widget/feed_widget.dart';

class FeedPage extends StatefulWidget {
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  fetchFeed() {}

  @override
  void initState() {
    fetchFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Feed'),
      ),
      body: Center(
        //edh pole baki set akenm
        //vnm enkil vere edit akenm
        child: FeedWidget(
            profPic: "",
            name: "Food Name/ 'title'",
            timePosted: "time Posted",
            descriptionPosted: "description Posted 'desc'",
            imagePosted: "image posted",
            likeCount: "like count",
            commentCount: "commentCount",
            shareCount: "shareCount"),
      ),
    );
  }
}
