import 'package:flutter/material.dart';

import '../Constant.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
      child: BottomNavigationBar(
        elevation: 2,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            backgroundColor: kPrimaryColor,
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            backgroundColor: kPrimaryColor,
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: kPrimaryColor,
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.yellow,
        showUnselectedLabels: true,
      ),
    );
  }
}
