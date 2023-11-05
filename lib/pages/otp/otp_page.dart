import 'package:finkin_credential/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading = false;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(28, 32, 33, 1.0)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.grey,
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
            color: Colors.purple.shade200,
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
        // if (otpCode != null) {
        //   verifyOtp(context, otpCode!);
        // } else {
        //   showSnackBar(context, "Enter 6 digit otp code");
        // }
      },
    );

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
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
                      "rout/images/OTP1.png",
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
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Resend New Code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
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
