import 'dart:async';

import 'package:finkin_credential/pages/agent_screen/agent_form.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController

    with GetSingleTickerProviderStateMixin {

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

  var timer;

  AuthController() {}

  @override
  onInit() async {
    super.onInit();
  }

 void startTimer() {
    _timer = Timer(Duration(seconds: 30), () {
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
      codeAutoRetrievalTimeout: (String verificationId) {
        
      },
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

  verifyOTP() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      statusMessage.value = "Verifying... " + otp.value;
      statusMessageColor = AppColor.textPrimary.obs;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: firebaseVerificationId, smsCode: otp.value);
      await auth.signInWithCredential(credential);
      Get.off(const AgentForm());
    } catch (e) {
      statusMessage.value = "Invalid  OTP";
      statusMessageColor = AppColor.textPrimary.obs;
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

  @override
  void dispose() {
    super.dispose();
  }
}
