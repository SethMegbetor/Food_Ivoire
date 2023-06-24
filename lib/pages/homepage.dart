import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

import './cart.dart';
import './explore.dart';
import './notification.dart';
import './profile.dart';
import './search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [ExplorePage(), SearchPage(), CartPage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => setState(() {
          _selectedPage = index;
        }),
        controller: _pageController,
        children: [...pages],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedPage,
        showElevation: false,
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home_outlined, size: 23),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.search, size: 23),
            title: Text('Search'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.shopping_bag_outlined, size: 23),
            title: Text('Cart'),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 23,
            ),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
