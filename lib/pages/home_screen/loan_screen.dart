import 'package:finkin_credential/models/loan_model/loan_model.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:finkin_credential/res/constants/enums/enums.dart';
import 'package:finkin_credential/res/image_asset/image_asset.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/Loan_Tracking_widget/loan_track.dart';

class LoanScreen extends StatelessWidget {
  final String title;
  final LoanStatus? status;
  const LoanScreen({Key? key, required this.title, this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<LoanModel> filteredItems = loanItems;

    if (status != null) {
      filteredItems =
          loanItems.where((element) => element.status == status).toList();
    }

    return Scaffold(
      appBar:
          title == 'Approved' ? _buildApprovedAppBar() : _buildRegularAppBar(),
      body: SafeArea(
        child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              final loan = filteredItems[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: LoanTrack(
                  imageAsset: loan.image,
                  userName: loan.userName,
                  loanType: loan.loanType,
                  date: loan.date,
                  icon: loan.icon,
                  status: loan.status,
                  onPressed: () {},
                ),
              );
            }),
      ),
    );
  }

  PreferredSizeWidget _buildRegularAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          color: AppColor.primary,
        ),
        child: AppBar(
          title: Center(child: Text(title)),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  PreferredSizeWidget _buildApprovedAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(210.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90),
            bottomRight: Radius.circular(90),
          ),
          color: AppColor.primary,
        ),
        child: AppBar(
          title: Center(
            child: Column(
              children: [
                Text(title),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatusColumn("This Month", Colors.blue, 50.0),
                    _buildStatusColumn("This Year", Colors.green, 50.0),
                  ],
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildStatusColumn(String text, Color color, double width) {
    return Column(
      children: [
        Text(text),
        const SizedBox(height: 10.0),
        Container(
          width: width,
          height: 10.0,
          color: color,
        ),
      ],
    );
  }
}

final loanItems = [
  LoanModel(
      image: ImageAsset.pop,
      userName: 'Roshan',
      loanType: 'Personal loan',
      date: DateTime.now(),
      status: LoanStatus.approved),
  LoanModel(
      image: ImageAsset.pop,
      userName: 'Roshan',
      loanType: 'Personal loan',
      date: DateTime.now(),
      status: LoanStatus.denied),
];
