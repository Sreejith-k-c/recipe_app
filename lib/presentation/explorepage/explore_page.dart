import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/global_widget/category_details/category_details.dart';
import 'package:recipe_app/global_widget/chef_details/chef_details.dart';
import 'package:recipe_app/global_widget/creators/all_creators.dart';
import 'package:recipe_app/presentation/explorepage/controller/expolre_page_controller.dart';

import '../all_categories/all_categories.dart';
import '../all_categories/controller/all_categories_controller.dart';
import '../search_details_screen/view/search_details_screen.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _FavoratePageState();
}

class _FavoratePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();

  var catergory = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpuJ4h2m9R-0ddUYVi53CjFBtByDjmhxdafA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk488-Mt1kJ0GxmhEr0h3lXlImeAkTNBXYbg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBenTu6SBmQSJsuPJxTjIAy5FRZx-bH2FWcw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgAw45JF1tN7IvLZBCWZQ68hWsMFlaDiNciQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1rdrz_ScMGHt9gqxMJ9Vv1wgFUfClfG46GA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGB9QhJNZkPEq2a-MJAcsbd7psr66xZJDgcg&usqp=CAU',
  ];
  List data = [
    'Ingredients',
    'Meal Type',
    'Cook Time',
    'Nutrition',
    'Diet',
  ];

  fetchData() {
    Provider.of<AllCategoriesScreenController>(context, listen: false)
        .fetchCategoriesList(context);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        // Padding(
        //   padding: const EdgeInsets.all(6.0),
        //   child: Container(
        //     height: 50,
        //     decoration: BoxDecoration(
        //         border: Border.all(color: Colors.black, width: 2),
        //         borderRadius: BorderRadius.circular(20)),
        //     child: TextFormField(
        //       controller: searchController,
        //       decoration: const InputDecoration(
        //           border: InputBorder.none,
        //           prefixIcon: Icon(
        //             Icons.search,
        //             size: 24,
        //             color: Colors.black,
        //           ),
        //           hintText: 'Search',
        //           hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
          child: Consumer<ExplorePageController>(
              builder: (context, controller, child) {
            return SearchBar(
              hintText: "Search",
              controller: searchController,
              onSubmitted: (result) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchDetailsScreen()));
                controller.fetchData(context, searchList: result.toLowerCase());
              },
            );
          }),
        ),
        // const SizedBox(
        //   height: 30,
        // ),
        // Container(
        //   height: 50,
        //   alignment: Alignment.center,
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 10, right: 10),
        //     child: GestureDetector(
        //       onTap: () => Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => const FilterPage(),
        //           )),
        //       child: ListView.builder(
        //         itemCount: data.length,
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (context, index) => Card(
        //           color: Colors.deepOrange,
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Text(
        //               data[index],
        //               style: const TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white,
        //                   fontSize: 18),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 250,
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Top categories",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AllCategories(),
                                        ));
                                  },
                                  child: const Text(
                                    'See All',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  child: Consumer<
                                          AllCategoriesScreenController>(
                                      builder: (context, controller, child) =>
                                          controller.isLoading == true
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : Container(
                                                  width: 150,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const CategoryDetails(),
                                                              )),
                                                      child: Image.network(
                                                        controller
                                                                .categoryModel
                                                                .data?[index]
                                                                .categoryImage ??
                                                            "",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //creators
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 300,
                      //height: double.maxFinite,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  'Popular Creators',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AllCreators(),
                                          ));
                                    },
                                    child: const Text(
                                      'See All',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  margin: const EdgeInsets.all(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChefDetails(),
                                              )),
                                          child: const CircleAvatar(
                                            maxRadius: 60,
                                            backgroundImage: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaJm2_Izxs7ZDpd7gs1DGi7Is3zvPJB-a9hg&usqp=CAU'),
                                          ),
                                        ),
                                        const Expanded(
                                            child: Text(
                                          'name',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ))
      ])),
    );
  }
}
