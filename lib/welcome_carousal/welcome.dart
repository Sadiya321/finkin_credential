import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:finkin_credential/welcome_carousal/page1.dart';
import 'package:finkin_credential/welcome_carousal/page2.dart';
import 'package:finkin_credential/welcome_carousal/page3.dart';
import 'package:finkin_credential/pages/login_screen/login_screen.dart';

class WelcomePage extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: screenHeight * 0.6, // Use a fraction of the screen height
            child: PageView(
              controller: _controller,
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const JumpingDotEffect(
              activeDotColor: AppColor.primary,
              dotColor: AppColor.textLight,
              dotHeight: 12,
              dotWidth: 12,
              spacing: 12,
              jumpScale: 3,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.02), // Responsive padding
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Get Started', style: TextStyle(color: AppColor.textLight)),
            ),
          ),
        ],
      ),
    );
  }
}
