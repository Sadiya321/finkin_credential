import 'package:finkin_credential/res/app_color.dart';
import 'package:flutter/material.dart';
import '../../widgets/Loan_Tracking_widget/loan_track.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), 
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(180),
              bottomRight: Radius.circular(120),
            ),
            color: AppColor.primary,
          ),
          child: AppBar(
            title: const Center(child: Text('Loan Tracking')),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent, 
            elevation: 0, 
          ),
        ),
      ),
      
      body: SafeArea(
        child: SingleChildScrollView(
  child: Column(
    children: [
      SizedBox(height: 16.0), 
      LoanTrack(
        imageAsset: 'lib/res/assets/images/pop.jpeg',
        userName: 'John Doe',
        loanType: 'Personal Loan',
        date: '2023-11-06',
        icon1: Icons.hourglass_full_rounded, 
        icon2: Icons.check_circle, 
        status: 'Approved',
        onPressed: () {
          // Add your onPressed callback logic here
        },
      ),
    ],
  ),
),

      ),
    );
  }
}
