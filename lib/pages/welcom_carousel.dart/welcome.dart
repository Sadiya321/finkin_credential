import 'package:finkin_credential/pages/otp/gen_OTP.dart';
import 'package:finkin_credential/pages/welcom_carousel.dart/page1.dart';
import 'package:finkin_credential/pages/welcom_carousel.dart/page2.dart';
import 'package:finkin_credential/pages/welcom_carousel.dart/page3.dart';
import 'package:finkin_credential/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController();
  final int numberOfPages = 3; // Total number of pages
  int currentPage = 0; // Track the current page

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // page view
              SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: numberOfPages,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Page1();
                    } else if (index == 1) {
                      return Page2();
                    } else {
                      return Page3();
                    }
                  },
                ),
              ),

              // dot indicators
              SmoothPageIndicator(
                controller: _controller,
                count: numberOfPages,
                effect: JumpingDotEffect(
                  activeDotColor: Colors.indigo,
                  dotColor: Colors.deepPurple.shade100,
                  dotHeight: 15,
                  dotWidth: 15,
                  spacing: 16,
                  jumpScale: 3,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          if (currentPage == numberOfPages - 1) // Display the button only on Page3
            Positioned(
              bottom: 16, // Adjust the bottom value as needed
              right: 16, // Adjust the right value as needed
              child: SizedBox(
                width: 80,
                height: 50,
                child: CustomButton(
                  text: "Next",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Genotp(),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
