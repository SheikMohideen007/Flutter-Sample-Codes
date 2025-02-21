import 'package:flutter/material.dart';
import 'package:frontend/screens/explore.dart';
import 'package:frontend/screens/home.dart';
import 'package:frontend/screens/profile.dart';
import 'package:frontend/screens/wish_list.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [Home(), Explore(), WishList(), Profile()],
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(0, 4),
                blurRadius: 8.0)
          ],
        ),
        child: WaterDropNavBar(
          inactiveIconColor: Colors.grey,
          waterDropColor: Colors.black,
          bottomPadding: 10,
          backgroundColor: Colors.grey.shade200,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.bounceInOut);
          },
          selectedIndex: selectedIndex,
          barItems: [
            BarItem(
              filledIcon: Icons.home_filled,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.search_sharp,
              outlinedIcon: Icons.search_outlined,
            ),
            BarItem(
                filledIcon: Icons.favorite_rounded,
                outlinedIcon: Icons.favorite_border_rounded),
            BarItem(
              filledIcon: Icons.account_circle,
              outlinedIcon: Icons.account_circle_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
