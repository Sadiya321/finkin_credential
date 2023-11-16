import 'package:finkin_credential/models/loan_model/loan_model.dart';
import 'package:finkin_credential/pages/loan_information/infodisplay.dart';
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfoDisplay(),
                      ),
                    );
                  },
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
      preferredSize: const Size.fromHeight(280.0),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: AppColor.primary,
            ),
          ),
          Positioned(
            top: 10,
            left: 5,
            right: 0,
            child: AppBar(
              toolbarHeight: 75.0,
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Text(title),
                      const SizedBox(height: 10.0),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "This Month ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "This Year",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(0, 236, 75, 75),
              elevation: 0,
            ),
          ),
          Positioned(
            bottom: 22,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColor.textLight,
                      width: 1.0,
                    ),
                  ),
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '21',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          TextSpan(
                            text: ' /',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.textLight,
                            ),
                          ),
                          TextSpan(
                            text: '25',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColor.textLight,
                      width: 1.0,
                    ),
                  ),
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '600',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.icon,
                            ),
                          ),
                          TextSpan(
                            text: ' /',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.textLight,
                            ),
                          ),
                          TextSpan(
                            text: '700',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
