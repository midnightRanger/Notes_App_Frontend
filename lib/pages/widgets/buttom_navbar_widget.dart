import 'package:dart_interface/pages/home_page.dart';
import 'package:dart_interface/pages/profile_page.dart';
import 'package:dart_interface/pages/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../globals/settings/utils/router_utils.dart';

class CustomBottomNavBar extends StatefulWidget {
  // create index to select from the list of route paths
  final int navItemIndex;

  const CustomBottomNavBar({required this.navItemIndex, Key? key})
      : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<Widget> pages = [
    HomePage(), 
    ProfilePage(),
    AuthScreen()
  ]; 

  // Make a list of routes that you'll want to go to
  static final List<String> _widgetOptions = [
    APP_PAGE.auth.routeName,
    APP_PAGE.home.routeName,
    APP_PAGE.profile.routeName,
  ];

// Function that handles navigation based of index received
  void _onItemTapped(int index) {
    GoRouter.of(context).goNamed(_widgetOptions[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      
      // List of icons that represent screen.
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: 'Shop',
        ),
      ],
      

      currentIndex: widget.navItemIndex, // current selected index
    
      onTap: _onItemTapped,
      
      
    ),
    body: pages[widget.navItemIndex],
    );
    
    
  }
}
