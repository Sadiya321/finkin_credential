import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:finkin_credential/welcome_carousal/page1.dart';
import 'package:finkin_credential/welcome_carousal/page2.dart';
import 'package:finkin_credential/welcome_carousal/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../pages/verification_screen/verification_screen.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: screenHeight * 0.6,
            child: PageView(
              controller: _controller,
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          if (currentPage == 0)
            const Text(
              'Sadiya Your Text Here',
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          if (currentPage == 1)
            const Text(
              'hilal Your Text Here',
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          if (currentPage == 2)
            const Text(
              'aleem Your Text Here',
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 20,
                fontStyle: FontStyle.italic,
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
          if (currentPage == 2)
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerificationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Get Started',
                      style: TextStyle(color: AppColor.textLight)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
