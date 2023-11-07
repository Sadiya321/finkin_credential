import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:finkin_credential/shared/widgets/Loan_Tracking_widget/loan_track.dart';
import 'package:flutter/material.dart';

class ApprovedScreen extends StatelessWidget {
  const ApprovedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(190.0), 
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            color: AppColor.primary,
          ),
          child: AppBar(
            title: const Center(child: Text('Approved Loan')),
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
      // const SizedBox(height: 16.0), 
      // LoanTrack(
      //   imageAsset: "assets/images/pop.jpeg",
      //   userName: 'Roshan',
      //   loanType: 'Personal Loan',
      //   date: DateTime.now(),
        
      //   icon2: Icons.check_circle, 
      //   status: 'Approved',
      //   onPressed: () {
      //     // Add your onPressed callback logic here
      //   },
      // ),
      //  LoanTrack(
      //   imageAsset: "assets/images/pop.jpeg",
      //   userName: 'John Doe',
      //   loanType: 'Personal Loan',
      //   date: DateTime.now(), 
      //   icon2: Icons.check_circle, 
      //   status: 'Approved',
      //   onPressed: () {
      //     // Add your onPressed callback logic here
      //   },
      // ),
      //  LoanTrack(
      //   imageAsset: "assets/images/pop.jpeg",
      //   userName: 'Asifa',
      //   loanType: 'Personal Loan',
      //   date: DateTime.now(),
      //   icon2: Icons.check_circle, 
      //   status: 'Approved',
      //   onPressed: () {
      //     // Add your onPressed callback logic here
      //   },
      // ),
      //  LoanTrack(
      //   imageAsset: "assets/images/pop.jpeg",
      //   userName: 'Deepti',
      //   loanType: 'Personal Loan',
      //   date: DateTime.now(),
      //   icon2: Icons.check_circle, 
      //   status: 'Approved',
      //   onPressed: () {
      //     // Add your onPressed callback logic here
      //   },
      // ),
      //  LoanTrack(
      //   imageAsset: "assets/images/pop.jpeg",
      //   userName: 'Sadiya',
      //   loanType: 'Personal Loan',
      //   date: DateTime.now(), 
      //   icon2: Icons.check_circle, 
      //   status: 'Approved',
      //   onPressed: () {
      //     // Add your onPressed callback logic here
      //   },
      // ),
      //  LoanTrack(
      //   imageAsset: "assets/images/pop.jpeg",
      //   userName: 'Danish',
      //   loanType: 'Personal Loan',
      //   date: DateTime.now(),
      //   icon2: Icons.check_circle, 
      //   status: 'Approved',
      //   onPressed: () {
      //     // Add your onPressed callback logic here
      //   },
      // ),
      //  LoanTrack(
      //   imageAsset: "assets/images/pop.jpeg",
      //   userName: 'Prashma',
      //   loanType: 'Personal Loan',
      //   date: DateTime.now(),
      //   icon2: Icons.check_circle, 
      //   status: 'Approved',
      //   onPressed: () {
      //     // Add your onPressed callback logic here
      //   },
      // ),
    ],
  ),
),

      ),
    );
  }
}

