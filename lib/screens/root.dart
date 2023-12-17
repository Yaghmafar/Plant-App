import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/cart_page.dart';
import 'package:plant_app/screens/favorite_page.dart';
import 'package:plant_app/screens/home_page.dart';
import 'package:plant_app/screens/profile_page.dart';
import 'package:plant_app/screens/scan_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 0;
  List<Plant> favorite = [];
  List<Plant> myCart = [];

  List<Widget> page() {
    return [
      const HomePage(),
       FavoritePage(favoritePlant: favorite),
       CartPage(addToCartPlant: myCart),
      const ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> appBarTitle = [
    'خانه',
    'علاقه‌مندی‌ها',
    'سبد‌خرید',
    'پروفایل',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                color: Constants.blackColor,
                Icons.notifications,
                size: 30.0,
              ),
              Text(
                appBarTitle[bottomIndex],
                style: const TextStyle(
                  color: Constants.blackColor,
                  fontFamily: 'Lalezar',
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: bottomIndex,
        children: page(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ScanPage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        splashSpeedInMilliseconds: 150,
        activeIndex: bottomIndex,
        inactiveColor: Colors.black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        icons: iconList,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            bottomIndex = index;

            final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

            favorite = favoritedPlants.toSet().toList();
            myCart = addedToCartPlants.toSet().toList();
          });
        },
      ),
    );
  }
}
