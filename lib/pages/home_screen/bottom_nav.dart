import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finkin_credential/pages/home_screen/account_screen.dart';
import 'package:finkin_credential/pages/home_screen/approved_screen.dart';
import 'package:finkin_credential/pages/home_screen/home_screen.dart';
import 'package:finkin_credential/pages/home_screen/loan_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List screens = [
    const HomeScreen(),
    const LoanScreen(),
    const ApprovedScreen(),
    const AccountScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        items: const [
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.content_paste_search,
            size: 30,
          ),
          Icon(
            Icons.book,
            size: 30,
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 30,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: screens[_selectedIndex],
    );
  }
}
