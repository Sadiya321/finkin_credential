import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finkin_credential/pages/agent_screen/agent_form.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/agent_model/agent_model.dart';
import '../pages/home_screen/bottom_nav.dart';
import '../repository/agent_repository/agent_repository.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var showPrefix = false.obs;
  var isLogin = true;
  var phoneNo = "".obs;
  var otp = "".obs;
  var isOtpSent = false.obs;
  var resendAfter = 30.obs;
  var resendOTP = false.obs;
  var firebaseVerificationId = "";
  var statusMessage = "".obs;
  var statusMessageColor = Colors.black.obs;
  var isButtonClickable = true.obs;
  Timer? _timer;
  static LoginController get instance => Get.find();
  final agentRepo = Get.put(AgentRepository());
  var timer;
  RxString agentId = ''.obs;

  LoginController() {
    initAuthListener();
  }
  // // AuthController() {}
  // final _auth = FirebaseAuth.instance;
  // late final Rx<User?> firebaseAgent;
  //
  // @override
  // void onReady() {
  //   firebaseAgent = Rx<User?>(_auth.currentUser);
  //   firebaseAgent.bindStream(_auth.userChanges());
  //   ever(firebaseAgent, _setInitialScreen);
  // }
  //
  // void _setInitialScreen(User? user) async {
  //   // await Future.delayed(const Duration(seconds: 1));
  //   if (user == null) {
  //     Get.off(() => WelcomePage());
  //   } else {
  //     // Check if the user is already on the WelcomePage, and if not, navigate to BottomNavBar
  //     if (Get.currentRoute != '/bottomNavBar') {
  //       Get.off(() => const BottomNavBar());
  //     }
  //   }
  // }

  @override
  onInit() async {
    super.onInit();
  }

  void startTimer() {
    _timer = Timer(Duration(seconds: 30), () {
      // Timer callback to reset the button clickability after 30 seconds
      isButtonClickable.value = true;
    });
  }

  getOtp() async {
    isButtonClickable.value = false;
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91' + phoneNo.value,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        statusMessage.value = "OTP sent to +91" + phoneNo.value;
        startResendOtpTimer();
        isButtonClickable.value = false;
        startTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  resendOtp() async {
    resendOTP.value = false;
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91' + phoneNo.value,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        statusMessage.value = "OTP re-sent to +91" + phoneNo.value;
        startResendOtpTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOTP({required String agentId}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      statusMessage.value = "Verifying... " + otp.value;
      statusMessageColor = AppColor.textPrimary.obs;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: firebaseVerificationId, smsCode: otp.value);
      await auth.signInWithCredential(credential);
      await storeAgentIdInFirestore(agentId);
      Get.off(AgentForm(agentId: agentId));
    } catch (e) {
      statusMessage.value = "Invalid  OTP";
      statusMessageColor = AppColor.textPrimary.obs;
    }
  }

  Future<void> storeAgentIdInFirestore(String agentId) async {
    try {
      String? uid = _auth.currentUser?.uid;

      if (uid != null) {
        CollectionReference agentsCollection =
            FirebaseFirestore.instance.collection('agents');

        await agentsCollection.doc(uid).set({
          'agentId': agentId,
          // Add other agent details if needed
        });
      }
    } catch (e) {
      // Handle Firestore error
      print("Error storing agentId in Firestore: $e");
    }
  }

  startResendOtpTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendAfter.value != 0) {
        resendAfter.value--;
      } else {
        resendAfter.value = 30;
        resendOTP.value = true;
        timer.cancel();
      }
      update();
    });
  }

  void initAuthListener() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        // User is signed in
        agentId.value = user.uid;
      } else {
        // User is signed out
        agentId.value = '';
      }
    });
  }

  Future<void> createAgent(AgentModel agent) async {
    await agentRepo.createAgent(agent);
    Get.to(() => const BottomNavBar());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
