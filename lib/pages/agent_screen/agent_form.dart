import 'package:finkin_credential/pages/home_screen/bottom_nav.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/agent_form_controller.dart';

class AgentForm extends StatefulWidget {
  const AgentForm({Key? key}) : super(key: key);

  @override
  State<AgentForm> createState() => _AgentFormState();
}

class _AgentFormState extends State<AgentForm> {
  final formKey = GlobalKey<FormState>();
  final AgentFormController controller = Get.put(AgentFormController());

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: AppColor.textLight,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Here  To  Get \n Welcome!',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
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
                  regexPattern: AgentFormController.nameRegex,
                  controller: controller.lastNameController,
                ),
                const SizedBox(
                  height: 5,
                ),
                LabeledTextField(
                  label: 'Enter Phone Number',
                  hintText: 'Enter Phone Number',
                  // regexPattern: AgentFormController.,
                  // controller: controller.firstNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                const LabeledTextField(
                  label: 'Enter Your Aadhar card Number',
                  hintText: 'Enter Your Aadhar card Number',
                  // regexPattern: aadharCardRegex,
                ),
                const SizedBox(
                  height: 10,
                ),
                const LabeledTextField(
                  label: 'Enter Your Pan card Number',
                  hintText: 'Enter Your Pan card Number',
                  // regexPattern: panCardRegex,
                ),
                const SizedBox(
                  height: 10,
                ),
                const LabeledTextField(
                  label: 'Enter Your Email Id',
                  hintText: 'Enter Your Email Id',
                  // regexPattern: emailRegex,
                ),
                const SizedBox(
                  height: 10,
                ),
                const LabeledTextField(
                  label: 'Enter Your Address',
                  hintText: 'Enter Your Address ',
                  // regexPattern: addressRegex,
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
                          const snackBar =
                              SnackBar(content: Text('Submitting Form'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomNavBar()),
                          );
                        }
                      },
                    ),
                  ],
                ),
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
