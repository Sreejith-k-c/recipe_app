import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/detailed_catagory_screen/controller/detailed_catogary_controller.dart';

class DetailedCatogoryScreen extends StatefulWidget {
  DetailedCatogoryScreen({super.key, this.tag});
  final tag;
  @override
  State<DetailedCatogoryScreen> createState() => _DetailedCatogoryScreenState();
}

class _DetailedCatogoryScreenState extends State<DetailedCatogoryScreen> {
  @override
  void initState() {
    Provider.of<DetailedCatogoryController>(context, listen: false)
        .fetchData(context, widget.tag);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Consumer<DetailedCatogoryController>(
        builder: (context, dControl, child) {
          return dControl.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: dControl.detailedCatagoryModel.data?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetails(hController.homeModel.data?[index])));
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
                                "${dControl.detailedCatagoryModel.data?[index].title}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("${dControl.detailedCatagoryModel.data?[index].totalTime}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "${dControl.detailedCatagoryModel.data?[index].image}",
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
                                  // IconButton(
                                  //   onPressed: () {
                                  //     _showCommentDialog(context);
                                  //   },
                                  //   icon: Icon(
                                  //     Icons.comment,
                                  //     color: Colors.black,
                                  //     size: 30,
                                  //   ),
                                  // ),
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
                  },);
        },
      ),
    ));
  }
}
