import 'package:carousel_slider/carousel_slider.dart';
import 'package:finkin_credential/models/loan_model/grid_model/grid_model.dart';
import 'package:finkin_credential/pages/loan_information/loan_form.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<String> imagePaths = [
    'assets/images/caros.jpg',
    'assets/images/money.jpg',
    'assets/images/education.jpg',
  ];

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Hello!',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.textLight,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Mohammed Hilal ',
                              style: TextStyle(
                                color: AppColor.textLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Good Morning Sir ',
                              style: TextStyle(
                                color: AppColor.textdivider,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/education.jpg'),
                            radius: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20, bottom: 0), 
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 3.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: imagePaths.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: AppColor.textLight,
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.textLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Explore Categories",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 1.3,
                          ),
                          itemCount: categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            Category category = categories[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoanForm()),
                                );
                              },
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.textLight,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        category.imagePath,
                                        width: 60,
                                        height: 60,
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        category.text,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
