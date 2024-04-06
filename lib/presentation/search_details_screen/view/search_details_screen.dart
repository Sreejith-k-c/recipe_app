import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../explorepage/controller/expolre_page_controller.dart';

class SearchDetailsScreen extends StatefulWidget {
  const SearchDetailsScreen({super.key});

  @override
  State<SearchDetailsScreen> createState() => _SearchDetailsScreenState();
}

class _SearchDetailsScreenState extends State<SearchDetailsScreen> {
  fetchData(){
    Provider.of<ExplorePageController>(context, listen: false).fetchData(
      context, );
  }
  @override
  void initState() {
   fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Consumer<ExplorePageController>(
        builder: (context,controller,child) {
          return ListView.builder(
              itemBuilder: (context, index) => Container(
                    child: Card(
                        child: ListTile(
                      leading: Container(
                        child: Image.network(controller.exploreModal.data?[index].imageUrl??""),
                      ),
                      title: Text(controller.exploreModal.data?[index].title??""),
                      subtitle: Text(controller.exploreModal.data?[index].totalTime??""),
                    )),
                  ));
        }
      ),
    );
  }
}
