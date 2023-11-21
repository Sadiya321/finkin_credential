import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:finkin_credential/controller/loan_form_controller.dart';
import 'package:finkin_credential/pages/home_screen/bottom_nav.dart';
import 'package:finkin_credential/pages/loan_information/selfemployeed_form.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'companyworker_form.dart';

class LoanForm extends StatefulWidget {
  final String title;

  const LoanForm({Key? key, required this.title}) : super(key: key);

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  final formKey = GlobalKey<FormState>();
  final LoanFormController controller = Get.put(LoanFormController());

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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            
            style: const TextStyle(
              color: AppColor.textLight,
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Personal Information'),
                  const SizedBox(height: 20),
                  _buildNameNumberSection(),
                  _buildEmailNumberSection(),
                  _buildPhoneNumberSection(),
                  _buildVerificationCodeSection(),
                  _buildDateOfBirthSection(),
                  _buildAddressSection(),
                  _buildPinCodeAndNationalitySection(),
                  _buildAadharNumberSection(),
                  _buildAadharCardUploadSection(),
                  _builPanNumberSection(),
                  _buildPANCardUploadSection(),
                  _buildEmployeeTypeSection(),
                ],
              ),
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

  Widget _buildNameNumberSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Full Name',
            hintText: 'Enter full name as per Aadhar card',
            regexPattern: LoanFormController.nameRegex,
            controller: controller.firstNameController,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailNumberSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Email',
            regexPattern: LoanFormController.emailRegex,
            controller: controller.emailController,
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Phone Number',
            regexPattern: LoanFormController.phoneNumberRegex,
            controller: controller.phoneNumberController,
          ),
        ),
        const SizedBox(width: 10),
        _buildVerificationButton(),
      ],
    );
  }

  Widget _buildAadharNumberSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Enter Your Aadhar Number',
            regexPattern: LoanFormController.aadharCardRegex,
            controller: controller.aadharCardController,
          ),
        ),
      ],
    );
  }

  Widget _builPanNumberSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Enter Your PAN Number',
            regexPattern: LoanFormController.panCardRegex,
            controller: controller.panCardController,
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationButton() {
    return ElevatedButton(
      onPressed: () {
        // setState(() {
        //   isPhoneNumberVerified = true;
        // });
      },
      style: ElevatedButton.styleFrom(
        primary: AppColor.icon,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        'Verify',
        style: TextStyle(color: AppColor.textLight),
      ),
    );
  }

  Widget _buildVerificationCodeSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Enter Verification Code',
            regexPattern: LoanFormController.pinCodeRegex,
            controller: controller.pinCodeController,
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
        if (formKey.currentState!.validate()) {
          setState(() {});
        }
      },
      style: ElevatedButton.styleFrom(
        primary: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        'Submit',
        style: TextStyle(color: AppColor.textLight),
      ),
    );
  }

  Widget _buildDateOfBirthSection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            icon: Icons.calendar_month_outlined,
            iconColor: AppColor.textPrimary,
            label: 'Date of Birth',
            regexPattern: LoanFormController.dateOfBirthRegex,
            controller: TextEditingController(
              text: selectedDate != null
                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                  : '',
            ),
            onTap: () => _selectDate(context),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressSection() {
    return Container(
      width: double.maxFinite,
      child: LabeledTextField(
        label: 'Address',
        regexPattern: LoanFormController.addressRegex,
        controller: controller.addressController,
      ),
    );
  }

  Widget _buildPinCodeAndNationalitySection() {
    return Row(
      children: [
        Expanded(
          child: LabeledTextField(
            label: 'Enter PIN Code',
            regexPattern: LoanFormController.pinCodeRegex,
            controller: controller.pinController,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: LabeledTextField(
            label: 'Nationality',
            regexPattern: LoanFormController.nameRegex,
            controller: controller.nationalityController,
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
                  child: const Text(
                    'View Image',
                    style: TextStyle(color: AppColor.textLight),
                  ),
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
                  child: const Text(
                    'Close',
                    style: TextStyle(color: AppColor.textLight),
                  ),
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
                    _buildEmployeeTypeButton('Self Employed', AppColor.primary),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(),
                    ),
                  );
                },
                child:
                    _buildCompanyTypeButton('Company Worker ', AppColor.primary),
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
        if (formKey.currentState!.validate()) {
          if (_pickedFile == null || _pickedFile2 == null) {
            const snackBar = SnackBar(
              content: Text(
                'Please select both Aadhar Card and PAN Card photos',
                style: TextStyle(color: AppColor.textLight),
              ),
              backgroundColor: AppColor.errorbar,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            const snackBar = SnackBar(
              content: Text(
                'Submitting Form',
                style: TextStyle(color: AppColor.textLight),
              ),
              backgroundColor: AppColor.primary,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SelfWorker()),
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: AppColor.textLight),
      ),
    );
  }

  Widget _buildCompanyTypeButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (_pickedFile == null || _pickedFile2 == null) {
            const snackBar = SnackBar(
              content: Text(
                'Please select both Aadhar Card and PAN Card photos',
                style: TextStyle(color: AppColor.textLight),
              ),
              backgroundColor: AppColor.errorbar,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            const snackBar = SnackBar(
              content: Text(
                'Submitting Form',
                style: TextStyle(color: AppColor.textLight),
              ),
              backgroundColor: AppColor.primary,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Companyworker()),
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: AppColor.textLight),
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
  final Color? iconColor;
  final Color? backgroundColor;

  const LabeledTextField({
    required this.label,
    this.hintText,
    this.onTap,
    this.icon,
    this.suffixWidget,
    this.controller,
    this.regexPattern,
    this.iconColor,
    this.backgroundColor,
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
              borderSide: BorderSide(
                color: AppColor.textdivider,
              ),
            ),
            suffixIcon: icon != null
                ? InkWell(
                    onTap: onTap,
                    child: Icon(
                      icon,
                      color: iconColor ?? Theme.of(context).iconTheme.color,
                    ),
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
