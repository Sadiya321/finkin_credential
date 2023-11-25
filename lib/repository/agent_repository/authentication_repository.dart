import 'package:finkin_credential/pages/home_screen/bottom_nav.dart';
import 'package:finkin_credential/welcome_carousal/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseAgent;

  @override
  void onReady() {
    firebaseAgent = Rx<User?>(_auth.currentUser);
    firebaseAgent.bindStream(_auth.userChanges());
    ever(firebaseAgent, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => WelcomePage())
        : Get.offAll(() => const BottomNavBar());
  }
}
