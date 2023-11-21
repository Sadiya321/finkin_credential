import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../pages/home_screen/home_screen.dart';

class LoginController extends GetxController {
  var authState = ''.obs; // Corrected variable name
  String verificationID = '';
  var auth = FirebaseAuth.instance;

  verifyPhone(String phone) async {
    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: phone,
      verificationCompleted: (AuthCredential authCredential) {},
      verificationFailed: (authException) {
        Get.snackbar("error", "problem when send the code");
      },
      codeSent: (String id, int? forceResent) {
        this.verificationID = id;
        authState.value = "login success"; // Corrected variable name
      },
      codeAutoRetrievalTimeout: (id) {
        this.verificationID = id;
      },
    );
  }

  verifyOTP(String otp) async {
    var credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationID, smsCode: otp));
    if (credential.user != null) {
      Get.to(HomeScreen());
    }
  }
}