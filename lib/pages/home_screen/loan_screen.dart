import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../widgets/Loan_Tracking_widget/loan_track.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Page'),
      ),
      body: Column(
        children: [
          // Using LoanTrack widget
          LoanTrack(
            imageAsset: 'your_image_url',
            userName: 'John Doe',
            loanType: 'Personal Loan',
            date: DateTime(DateTime.daysPerWeek),
            icon1: FontAwesome.hourglass_2,
            icon2: Icons.ice_skating,
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
