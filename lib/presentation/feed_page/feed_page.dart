import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/global_widget/feed_widget/feed_widget.dart';

import 'feed_page_controller.dart';

class FeedPage extends StatefulWidget {
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  fetchFeed() {
    Provider.of<FeedPageController>(context, listen: false).fetchFeed(context);
  }

  @override
  void initState() {
    fetchFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.orange[300],
        appBar: AppBar(
          // backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Feed'),
        ),
        body: Consumer<FeedPageController>(
          builder: (context, fContro, child) {
            return fContro.isLoading ==true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: fContro.feedModel.data?.length,
                    itemBuilder: (context, index) {
                      return Center(
                        //edh pole baki set akenm
                        //vnm enkil vere edit akenm
                        child: FeedWidget(
                            // profPic: fContro.feedModel.data![index].picture.toString(),
                            name: fContro.feedModel.data![index].username
                                .toString(),
                            timePosted: fContro.feedModel.data![index].cookTime
                                .toString(),
                            descriptionPosted: fContro
                                .feedModel.data![index].procedure
                                .toString(),
                            imagePosted: fContro.feedModel.data![index].picture
                                .toString(),
                            showBlueTick: fContro.feedModel.data![index].staff,
                            likeCount: fContro
                                .feedModel.data![index].totalNumberOfLikes
                                .toString(),
                            commentCount: fContro
                                .feedModel.data![index].totalNumberOfComments
                                .toString(),
                            shareCount: fContro
                                .feedModel.data![index].totalNumberOfBookmarks
                                .toString(),
                            itemId:  fContro
                                .feedModel.data![index].id,    
                                ),
                      );
                    });
          },
        ));
  }
}
