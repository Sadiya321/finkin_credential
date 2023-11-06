import 'package:flutter/material.dart';
import '../../widgets/Loan_Tracking_widget/loan_track.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Loan Tracking')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Use the LoanTrack widget here
            LoanTrack(
              imageAsset: 'your_image_url',
              userName: 'John Doe',
              loanType: 'Personal Loan',
              date: '2023-11-06',
              icon1: Icons.hourglass_full_rounded, // Use the approved icon
              icon2: Icons.check_circle, // You can use another icon for icon2
              status: 'Approved',
              onPressed: () {
                // Handle onTap
              },
            ),
            // Add more LoanTrack widgets as needed
          ],
        ),
      ),
    );
  }
}
