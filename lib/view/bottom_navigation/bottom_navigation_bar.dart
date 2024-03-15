import 'package:flutter/material.dart';
import 'package:recipe_app/view/explorepage/explore_page.dart';
import 'package:recipe_app/view/saved/savedPage.dart';
import 'package:recipe_app/view/homepage/homepage.dart';
import 'package:recipe_app/view/profile_page/user_profile/profilepage.dart';
import 'package:recipe_app/view/widgets/add_recipe/add_recipe.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  List screens = [
    const HomePage(),
    const ExplorePage(),
    const AddRecipe(),
    const SavedPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() => currentIndex = value);
          },
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_add_outlined,
                size: 30,
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
