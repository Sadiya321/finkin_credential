import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  // Add controllers for other fields

  // Regex patterns
  static const String nameRegex = r'^[A-Za-z\s]+$';
  // Add other regex patterns

  @override
  void onInit() {
    super.onInit();
    // Add any initialization logic if needed
  }

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar('Success', 'Submitting Form');
      // Add navigation logic here
      return true;
    } else {
      Get.snackbar('Error', 'Please fix the errors in the form');
      return false;
    }
  }
}
