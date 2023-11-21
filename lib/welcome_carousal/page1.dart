import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: AppColor.primary,
            child: Image.asset(
              'assets/images/money.jpg',
              fit: BoxFit.cover, 
            ),
          ),
        ),
      ),
    );
  }
}
