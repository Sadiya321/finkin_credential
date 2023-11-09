import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel_slider package
import 'package:finkin_credential/pages/home_screen/account_screen.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of image paths for the carousel
  List<String> images = [
    'assets/images/pop.jpeg',
    'assets/images/pop.jpeg',
    'assets/images/pop.jpeg',
    // Add more image paths here
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.textLight,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'User Name!',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.textLight,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Good Morning Sir!',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.textdivider,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //profile
                      Container(
                        padding: const EdgeInsets.only(top: 12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AccountScreen(),
                              ),
                            );
                          },
                          child: const Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/pop.jpeg"),
                                radius: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.textLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                  ),
                ),
                padding: const EdgeInsets.all(25),
                child: CarouselSlider(
                  items: images.map((imagePath) {
                    return Image.asset(imagePath, fit: BoxFit.cover);
                  }).toList(),
                  options: CarouselOptions(
                    height: 200, // Adjust the height as needed
                    enlargeCenterPage: true,
                    autoPlay: true, // Set it to true for auto-play
                    autoPlayInterval:
                        Duration(seconds: 3), // Adjust the interval
                    autoPlayAnimationDuration: Duration(
                        milliseconds: 800), // Adjust the animation duration
                    autoPlayCurve:
                        Curves.fastOutSlowIn, // Adjust the animation curve
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
