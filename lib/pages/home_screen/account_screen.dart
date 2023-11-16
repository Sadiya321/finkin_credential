import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:finkin_credential/res/image_asset/image_asset.dart';
import 'package:finkin_credential/shared/widgets/Account_Tracking_Widget/accout_track.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                                press: () async {
                                  _showAccountInfoBottomSheet(context);
                                },
                              ),

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
                                  _showContactInfoBottomSheet(context);
                                },
                              ),
                              //LogOut
                              const SizedBox(height: 10),
                              Accounttrack(
                                icon: ImageAsset.logout,
                                text: "Log Out",
                                press: () {
                                  _showLogoutConfirmationDialog(context);
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
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Logout Confirmation",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Do you want to Log Out?"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: AppColor.primary,
                      ),
                      child: const Text("No"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: AppColor.primary,
                      ),
                      child: const Text("Yes"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAccountInfoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [AppColor.combination, AppColor.primary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      labelText: "Location",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.email, color: Colors.white),
                  title: TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.credit_card,
                    color: Colors.white,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      labelText: "Aadhar Card Number",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.description,
                    color: Colors.white,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      labelText: "Pan Card Number",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(height: 56),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showContactInfoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
              gradient: LinearGradient(
                colors: [AppColor.combination, AppColor.primary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/education.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Beeri, Mangalore",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.textLight,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColor.textdivider,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.person_2_outlined,
                        color: AppColor.primary,
                      ),
                      title: const Text(
                        "8217696772",
                        style: TextStyle(color: AppColor.textdivider),
                      ),
                      trailing: GestureDetector(onTap: () async {
                        String telephoneNumber = '+2347012345678';
                        String telephoneUrl = "tel:$telephoneNumber";
                        if (await canLaunch(telephoneUrl)) {
                          await launch(telephoneUrl);
                        } else {
                          throw "Error occured trying to call that number.";
                        }
                        const Icon(
                          Icons.call,
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 56),
              ],
            ),
          ),
        );
      },
    );
  }
}
