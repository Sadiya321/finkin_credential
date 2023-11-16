import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:finkin_credential/res/image_asset/image_asset.dart';
import 'package:finkin_credential/shared/widgets/Account_Tracking_Widget/accout_track.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../login_screen/login_screen.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  LoginController controller = Get.find();
  var auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        width: double.infinity,
        color: AppColor.textLight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  color: AppColor.textLight,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(ImageAsset.pop),
                              radius: 80,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          "User Name Here",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Accounttrack(
                                icon: ImageAsset.user,
                                text: "My Account",
                                press: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => MyAccountPage(),
                                  //   ),
                                  // );
                                },
                              ),
                              //App Setting
                              const SizedBox(height: 10),
                              Accounttrack(
                                  icon: ImageAsset.settings,
                                  text: "Settings",
                                  press: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         const settingPage(),
                                    //   ),
                                    // );
                                  }),
                              //Help
                              const SizedBox(height: 10),
                              Accounttrack(
                                icon: ImageAsset.contact,
                                text: "Contact",
                                press: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const HelpPage(),
                                  //   ),
                                  // );
                                },
                              ),
                              //LogOut
                              const SizedBox(height: 10),
                              Accounttrack(
                                icon: ImageAsset.logout,
                                text: "Log Out",
                                press: () {
                                  auth.signOut();
                                  if (auth.currentUser == null) {
                                    Get.to(LoginScreen());
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout Confirmation"),
          content: const Text("Do you want to exit the app?"),
          actions: <Widget>[
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                // Close the app
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
