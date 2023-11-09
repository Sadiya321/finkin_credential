import 'dart:io';

import 'package:finkin_credential/pages/loan_information/employment_form.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoanForm extends StatefulWidget {
  const LoanForm({Key? key}) : super(key: key);

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  bool isPhoneNumberVerified = false;
  XFile? _pickedFile;
  XFile? _pickedFile2;
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
                _buildSectionTitle('Personal Information'),
                const SizedBox(height: 20),
                const LabeledTextField(
                  label: 'Full Name',
                  hintText: 'Enter full name as per Aadhar card',
                ),
                const SizedBox(height: 10),
                const LabeledTextField(label: 'Email'),
                _buildPhoneNumberSection(),
                _buildVerificationCodeSection(),
                _buildDateOfBirthSection(),
                const SizedBox(height: 10),
                _buildAddressSection(),
                _buildPinCodeAndNationalitySection(),
                const SizedBox(height: 10),
                const LabeledTextField(label: 'Enter Your Aadhar Number'),
                _buildAadharCardUploadSection(),
                const SizedBox(height: 10),
                const LabeledTextField(label: 'Enter Your PAN Number'),
                _buildPANCardUploadSection(),
                const SizedBox(height: 10),
                _buildEmployeeTypeSection(),
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

  Widget _buildPhoneNumberSection() {
    return Row(
      children: [
        const Expanded(
          child: LabeledTextField(
            label: 'Phone Number',
          ),
        ),
        const SizedBox(width: 10),
        _buildVerificationButton(),
      ],
    );
  }

  Widget _buildVerificationButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ElevatedButton(
        onPressed: () {
          // Add verification logic here
          setState(() {
            isPhoneNumberVerified = true;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: AppColor.icon,
        ),
        child: const Text('Verify'),
      ),
    );
  }

  Widget _buildVerificationCodeSection() {
    return Row(
      children: [
        const Expanded(
          child: LabeledTextField(
            label: 'Enter Verification Code',
          ),
        ),
        const SizedBox(width: 10),
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isPhoneNumberVerified = true;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: AppColor.primary,
        ),
        child: const Text('Submit'),
      ),
    );
  }

  Widget _buildDateOfBirthSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            icon: Icons.calendar_month_outlined,
            label: 'Date of Birth',
            onTap: () => _selectDate(context),
            controller: TextEditingController(
              text: selectedDate != null
                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                  : '',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressSection() {
    return Container(
      width: double.maxFinite,
      child: const LabeledTextField(
        label: 'Address',
      ),
    );
  }

  Widget _buildPinCodeAndNationalitySection() {
    return const Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Pin Code',
            hintText: 'Enter your pin code',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: LabeledTextField(
            label: 'Nationality',
            hintText: 'Enter your nationality',
          ),
        ),
      ],
    );
  }

  Widget _buildAadharCardUploadSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Upload Your Aadhar Card Photo',
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
            label: 'Upload Your PAN Card Photo',
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

  Widget _buildEmployeeTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Choose Type Of Employee",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EmploymentForm()),
                  );
                },
                child:
                    _buildEmployeeTypeButton('Self Employed', AppColor.primary),
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: GestureDetector(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const EmploymentForm()),
                //   );
                // },
                child: _buildEmployeeTypeButton(
                    'Company Worker', AppColor.primary),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ],
    );
  }

  Widget _buildEmployeeTypeButton(String text, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        child: Text(text),
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

  const LabeledTextField({
    required this.label,
    this.hintText,
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
            hintText: hintText,
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
