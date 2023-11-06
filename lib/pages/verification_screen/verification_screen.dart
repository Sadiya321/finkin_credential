import 'package:finkin_credential/pages/agent_screen/agent.dart';
import 'package:finkin_credential/pages/agent_screen/agent_form.dart';
import 'package:finkin_credential/res/app_color.dart';
import 'package:finkin_credential/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading = false;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: AppColor.primary,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.primary,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: AppColor.primary,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColor.primary,
      ),
    );

    // OTP Verification Section
    Pinput otpInputWidget = Pinput(
      length: 6,
      showCursor: true,
      defaultPinTheme: PinTheme(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.primary,
          ),
        ),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      onCompleted: (value) {
        setState(() {
          otpCode = value;
        });
      },
    );

    CustomButton verifyButton = CustomButton(
        text: "Verify",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AgentPage()),
          );
        });

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 8),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      " ",
                      width: 260,
                      height: 260,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "OTP Verification",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "We need to register your phone before getting started!",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    otpInputWidget, // Add OTP input here
                    const SizedBox(height: 25),
                    verifyButton, // Add Verify button here
                    const SizedBox(height: 20),
                    const Text(
                      "Didn't receive any code?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Resend New Code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

//   // verify otp
//   void verifyOtp(BuildContext context, String userOtp) {
//     final ap = Provider.of<AuthProvider>(context, listen: false);
//     ap.verifyOtp(
//       context: context,
//       verificationId: widget.verificationId,
//       userOtp: userOtp,
//       onSuccess: () {
//         Navigator.push(context, MaterialPageRoute(builder: (_) => Wrapper(user: ap.getCurrentUser(),)));
//       },
//     );
  // }
}
