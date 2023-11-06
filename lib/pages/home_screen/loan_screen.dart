import 'package:flutter/material.dart';

import '../../widgets/Loan_Tracking_widget/loan_track.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Column(
        children: [
          // Use the LoanTrack widget here
          LoanTrack(
            imageAsset: 'your_image_url',
            userName: 'John Doe',
            loanType: 'Personal Loan',
            date: '2023-11-06',
            icon1: 'your_icon_data_as_string',
            icon2: 'your_icon2_data_as_string',
            status: 'Approved',
            onPressed: () {
              // Handle onTap
            },
          ),
          // Add more LoanTrack widgets as needed
        ],
      ),
    );
  }
}
