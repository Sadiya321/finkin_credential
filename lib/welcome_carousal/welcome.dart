import 'package:finkin_credential/pages/home_screen/account_screen.dart';
import 'package:finkin_credential/pages/login_screen/login_screen.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:finkin_credential/welcome_carousal/page1.dart';
import 'package:finkin_credential/welcome_carousal/page2.dart';
import 'package:finkin_credential/welcome_carousal/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 500,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    
                    primary: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Verify'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
