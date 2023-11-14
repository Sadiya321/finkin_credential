import 'dart:io';

import 'package:finkin_credential/pages/loan_information/selfemployeed_form.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'companyworker_form.dart';

class LoanForm extends StatefulWidget {
  final String title;
  const LoanForm({Key? key, required this.title}) : super(key: key);

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPhoneNumberVerified = false;
  XFile? _pickedFile;
  XFile? _pickedFile2;
  DateTime? selectedDate;
  get title => widget.title;

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
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primary,
          automaticallyImplyLeading: false,
        ),
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
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isPhoneNumberVerified = true;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: AppColor.icon,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text('Verify'),
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
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          setState(() {
            isPhoneNumberVerified = true;
          });
        }
      },
      style: ElevatedButton.styleFrom(
        primary: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text('Submit'),
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
            padding: const EdgeInsets.all(21),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showImageDialog(pickedFile);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('View Image'),
                ),
                const SizedBox(height: 5),
                Text(
                  pickedFile.name,
                  style: const TextStyle(
                    color: AppColor.textLight,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  void _showImageDialog(XFile pickedFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.file(
                  File(pickedFile.path),
                  height: 500,
                  width: 500,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
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
              
                child:
                    _buildCompanyTypeButton('Self Employed', AppColor.primary),
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: GestureDetector(
                onTap: () {
                
                },
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
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Companyworker()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(text),
    );
  }
    Widget _buildCompanyTypeButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SelfWorker()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(text),
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
