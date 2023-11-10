import 'dart:io';

import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CompanyWorker extends StatefulWidget {
  const CompanyWorker({Key? key}) : super(key: key);

  @override
  State<CompanyWorker> createState() => _CompanyWorkerState();
}

class _CompanyWorkerState extends State<CompanyWorker> {
  bool isPhoneNumberVerified = false;
  XFile? _pickedFile;
  XFile? _pickedFile2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Employment Information'),
                const SizedBox(height: 20),
                const LabeledTextField(
                  label: 'Monthly Income',
                ),
                const SizedBox(height: 20),
                _buildAadharCardUploadSection(),
                const SizedBox(height: 10),
                _buildPANCardUploadSection(),
                const SizedBox(
                  height: 10,
                ),
                _buildSubmitButton(), // Added Submit Button
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAadharCardUploadSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Please Upload Your Form 16',
            suffixWidget: _buildChooseFileButton(_pickedFile, () async {
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              setState(() {
                _pickedFile = pickedFile;
              });
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildPANCardUploadSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Upload Your Bank Statement (6 Months - 1 Year)',
            suffixWidget: _buildChooseFileButton(_pickedFile2, () async {
              final pickedFile2 =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              setState(() {
                _pickedFile2 = pickedFile2;
              });
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildChooseFileButton(XFile? pickedFile, VoidCallback onPressed) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(20),
            color: AppColor.subtext,
            child: const Text(
              'Choose File',
              style: TextStyle(
                color: AppColor.textLight,
              ),
            ),
          ),
        ),
        if (pickedFile != null)
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.file(
              File(pickedFile.path),
              height: 40,
              width: 216,
            ),
          ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: AppColor.primary,
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text('Submit', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

class LabeledTextField extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback? onTap;
  final Widget? suffixWidget;
  final TextEditingController? controller;

  const LabeledTextField({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.suffixWidget,
    this.controller,
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
            border: const OutlineInputBorder(),
            suffixIcon: icon != null
                ? InkWell(
                    onTap: onTap,
                    child: Icon(icon),
                  )
                : suffixWidget,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
