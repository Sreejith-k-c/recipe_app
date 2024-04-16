import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/feed_page/controller/feed_page_controller.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.id});

  final int? id;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  fetchData() {
    Provider.of<FeedPageController>(context, listen: false).fetchComments(widget.id, context);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Consumer<FeedPageController>(builder: (context, controller, _) {
      return Scaffold(
        appBar: AppBar(title: Text("Comments")),
        body: ListView.builder(
            itemCount: controller.commentsModel.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(),
                title: Text(controller.commentsModel.data?[index].text ?? ""),
              );
            }),
        bottomNavigationBar: Row(
          children: [
            SizedBox(width: size.width*.1),
            SizedBox(width: size.width*.6, child: TextFormField()),
            ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.send), label: Text(""))
          ],
        ),
      );
    });
  }
}
