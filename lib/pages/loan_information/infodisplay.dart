import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_stepper_flutter/horizontal_stepper_flutter.dart';


class InfoDisplay extends StatefulWidget {
  const InfoDisplay({Key? key}) : super(key: key);

  @override
  State<InfoDisplay> createState() => _InfoDisplayState();
}

class _InfoDisplayState extends State<InfoDisplay> {
  bool isPersonalDetailsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan'),
        backgroundColor: AppColor.primary,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: AppColor.textLight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const InkWell(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/money.jpg',
                      ),
                      radius: 50,
                      backgroundColor: AppColor.secondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Abdul Aleem Sheikh",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "USER-17845005",
                    style: TextStyle(
                      color: AppColor.textdivider,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(31),
                    width: 370,
                    decoration: BoxDecoration(
                      color: AppColor.textLight,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColor.textPrimary,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Application Tracking ID : HM-BS-8741550",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: FlutterHorizontalStepper(
                            titleStyle:
                                const TextStyle(color: AppColor.primary),
                            steps: const [
                              "Application sent",
                              "Approval Pending",
                              "Loan Approved",
                            ],
                            radius: 45,
                            currentStep: 2,
                            currentStepColor: AppColor.secondary,
                            child: const [
                              Icon(Icons.bookmark_add_sharp),
                              Icon(Icons.hourglass_top_sharp),
                              Icon(Icons.check_rounded, size: 32),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPersonalDetailsSelected = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 50),
                            primary: isPersonalDetailsSelected
                                ? AppColor.primary
                                : AppColor.subtext,
                          ),
                          child: const Text('Personal Details',
                              style: TextStyle(fontSize: 13)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPersonalDetailsSelected = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 50),
                            primary: isPersonalDetailsSelected
                                ? AppColor.subtext
                                : AppColor.primary,
                          ),
                          child: const Text('Other Details',
                              style: TextStyle(fontSize: 13)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),const SizedBox(height: 10),
            Expanded(
              child: Container(
                color: AppColor.textLight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: const [
                    LabeledTextField2(
                      label: 'Full Name',
                      hintText: 'Abdul Aleem Sheikh',
                    ),
                    SizedBox(height: 10),
                    LabeledTextField2(
                      label: 'Email',
                      hintText: 'aleemsheikh@gmail.com',
                    ),
                    SizedBox(height: 10),
                    LabeledTextField2(
                      label: 'Phone ',
                      hintText: '953503521',
                    ),
                    SizedBox(height: 10),
                    LabeledTextField2(
                      label: 'Date Of Birth ',
                      hintText: '28/9/2000',
                    ),
                    SizedBox(height: 10),
                    LabeledTextField2(
                      label: 'Address',
                      hintText: 'Mangalore',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
class LabeledTextField2 extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String? hintText;
  final VoidCallback? onTap;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final String? regexPattern;

  const LabeledTextField2({
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
          readOnly: true, // Set readOnly to true to make the text field non-editable
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

