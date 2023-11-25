import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finkin_credential/pages/home_screen/account_screen.dart';
import 'package:finkin_credential/pages/home_screen/home_screen.dart';
import 'package:finkin_credential/pages/home_screen/loan_screen.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:finkin_credential/res/constants/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  LoginController controller = Get.find();
  List screens = [
    const HomeScreen(),
    const LoanScreen(
      title: 'Loan Tracking',
    ),
    const LoanScreen(
      title: 'Approved',
      status: LoanStatus.approved,
    ),
    AccountScreen(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.textLight,
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        buttonBackgroundColor: AppColor.icon,
        backgroundColor: AppColor.textLight,
        height: 50,
        color: AppColor.primary,
        index: _selectedIndex,
        items: const [
          Icon(
            Icons.home,
            color: AppColor.textLight,
            size: 30,
          ),
          Icon(
            Icons.content_paste_search,
            color: AppColor.textLight,
            size: 30,
          ),
          Icon(
            Icons.book,
            color: AppColor.textLight,
            size: 30,
          ),
          Icon(
            Icons.account_circle_outlined,
            color: AppColor.textLight,
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
