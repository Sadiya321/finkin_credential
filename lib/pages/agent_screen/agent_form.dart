import 'dart:io';

import 'package:finkin_credential/controller/agent_form_controller.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/login_controller.dart';
import '../../models/agent_model/agent_model.dart';

class AgentForm extends StatefulWidget {
  const AgentForm({Key? key, required String agentId}) : super(key: key);

  @override
  State<AgentForm> createState() => _AgentFormState();
}

class _AgentFormState extends State<AgentForm> {
  final formKey = GlobalKey<FormState>();
  final AgentFormController controller = Get.put(AgentFormController());
  final LoginController loginController = Get.put(LoginController());
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          toolbarHeight: 125.0,
          backgroundColor: AppColor.textLight,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Here  To  Get \n Welcome!',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: _selectedImage != null
                                ? FileImage(_selectedImage!)
                                : const AssetImage(
                                        'assets/default_profile_image.png')
                                    as ImageProvider<Object>,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.textLight,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                LabeledTextField(
                  label: 'Enter First Name',
                  hintText: 'Enter First Name',
                  regexPattern: AgentFormController.nameRegex,
                  controller: controller.firstNameController,
                ),
                const SizedBox(
                  height: 5,
                ),
                LabeledTextField(
                  label: 'Enter Last Name',
                  hintText: 'Enter Last Name',
                  // regexPattern: AgentFormController.nameRegex,
                  // controller: controller.firstNameController,
                ),
                const SizedBox(
                  height: 5,
                ),
                LabeledTextField(
                  label: 'Enter Phone Number',
                  hintText: 'Enter Phone Number',
                  // regexPattern: AgentFormController.phoneNumberRegex,
                  // controller: controller.phoneNumberController,
                ),
                const SizedBox(
                  height: 5,
                ),
                LabeledTextField(
                  label: 'Enter Your Aadhar card Number',
                  hintText: 'Enter Your Aadhar card Number',
                  //  regexPattern: AgentFormController.aadharCardRegex,
                  //   controller: controller.aadharCardController,
                ),
                const SizedBox(
                  height: 10,
                ),
                LabeledTextField(
                  label: 'Enter Your Pan card Number',
                  hintText: 'Enter Your Pan card Number',
                  //  regexPattern: AgentFormController.panCardRegex,
                  //   controller: controller.panCardController,
                ),
                const SizedBox(
                  height: 10,
                ),
                LabeledTextField(
                  label: 'Enter Your Email Id',
                  hintText: 'Enter Your Email Id',
                  // regexPattern: AgentFormController.emailRegex,
                  // controller: controller.emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                LabeledTextField(
                  label: 'Enter Your Address',
                  hintText: 'Enter Your Address ',
                  //  regexPattern: AgentFormController.phoneNumberRegex,
                  //   controller: controller.addressController,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      backgroundColor: AppColor.primary,
                      child: const Stack(
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: AppColor.textLight,
                          ),
                        ],
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          const snackBar = SnackBar(
                            content: Text(
                              'Submitting Form',
                              style: TextStyle(color: AppColor.textLight),
                            ),
                            backgroundColor: AppColor.primary,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const BottomNavBar()),
                          // );
                          final agent = AgentModel(
                            name: controller.firstNameController.text.trim(),
                            phone: controller.phoneNumberController.text.trim(),
                            email: controller.emailController.text.trim(),
                            aadhar: controller.aadharCardController.text.trim(),
                            pan: controller.panCardController.text.trim(),
                            address: controller.addressController.text.trim(),
                            agentId: loginController.agentId.value,
                          );
                          LoginController.instance.createAgent(agent);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LabeledTextField extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String? hintText;
  final VoidCallback? onTap;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final String? regexPattern;

  const LabeledTextField({
    required this.label,
    this.hintText,
    this.onTap,
    this.icon,
    this.suffixWidget,
    this.controller,
    this.regexPattern,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textdivider),
            ),
            suffixIcon: icon != null
                ? InkWell(
                    onTap: onTap,
                    child: Icon(icon),
                  )
                : suffixWidget,
          ),
          cursorColor: AppColor.textPrimary,
          validator: (value) {
            if (regexPattern != null && value != null) {
              final RegExp regex = RegExp(regexPattern!);
              if (!regex.hasMatch(value)) {
                return 'Invalid format';
              }
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
