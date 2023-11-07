import 'package:finkin_credential/models/loan_model/loan_model.dart';
import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:finkin_credential/res/constants/enums/enums.dart';
import 'package:finkin_credential/res/image_asset/image_asset.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/Loan_Tracking_widget/loan_track.dart';

class LoanScreen extends StatelessWidget {
  final String title;
  final LoanStatus? status;
  const LoanScreen({Key? key, required this.title, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<LoanModel> filteredItems = loanItems;

    if (status != null) {
      filteredItems = loanItems.where((element) => element.status == status).toList();
    }

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
            title: Center(child: Text(title)),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent, 
            elevation: 0, 
          ),
        ),
      ),
      
      body: SafeArea(
        child: ListView.builder(
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
          final loan = filteredItems[index];
          return LoanTrack(
            imageAsset: loan.image,
            userName: loan.userName,
            loanType: loan.loanType,
            date: loan.date,
            icon: loan.icon,
            status: loan.status,
            onPressed: () {
              // Add your onPressed callback logic here
            },
          );
        }),

      ),
    );
  }
}


final loanItems = [
  LoanModel(image: ImageAsset.pop, userName: 'Roshan', loanType: 'Personal loan', date: DateTime.now(), status: LoanStatus.approved),
  LoanModel(image: ImageAsset.pop, userName: 'Roshan', loanType: 'Personal loan', date: DateTime.now(), status: LoanStatus.denied ),

];

// [
//       const SizedBox(height: 16.0), 
//       LoanTrack(
//         imageAsset: "assets/images/pop.jpeg",
//         userName: 'Roshan',
//         loanType: 'Personal Loan',
//         date: DateTime.now(),
//         icon1: Icons.hourglass_top_outlined, 
//         icon2: Icons.check_circle, 
//         status: 'Approved',
//         onPressed: () {
//           // Add your onPressed callback logic here
//         },
//       ),
//        LoanTrack(
//         imageAsset: "assets/images/pop.jpeg",
//         userName: 'John Doe',
//         loanType: 'Personal Loan',
//         date: DateTime.now(),
//         icon1: Icons.hourglass_top_outlined, 
//         icon2: Icons.check_circle, 
//         status: 'Approved',
//         onPressed: () {
//           // Add your onPressed callback logic here
//         },
//       ),
//        LoanTrack(
//         imageAsset: "assets/images/pop.jpeg",
//         userName: 'Asifa',
//         loanType: 'Personal Loan',
//         date: DateTime.now(),
//         icon1: Icons.hourglass_top_outlined, 
//         icon2: Icons.check_circle, 
//         status: 'Approved',
//         onPressed: () {
//           // Add your onPressed callback logic here
//         },
//       ),
//        LoanTrack(
//         imageAsset: "assets/images/pop.jpeg",
//         userName: 'Deepti',
//         loanType: 'Personal Loan',
//         date: DateTime.now(),
//         icon1: Icons.hourglass_top_outlined, 
//         icon2: Icons.check_circle, 
//         status: 'Approved',
//         onPressed: () {
//           // Add your onPressed callback logic here
//         },
//       ),
//        LoanTrack(
//         imageAsset: "assets/images/pop.jpeg",
//         userName: 'Sadiya',
//         loanType: 'Personal Loan',
//         date: DateTime.now(),
//         icon1: Icons.hourglass_top_outlined, 
//         icon2: Icons.check_circle, 
//         status: 'Approved',
//         onPressed: () {
//           // Add your onPressed callback logic here
//         },
//       ),
//        LoanTrack(
//         imageAsset: "assets/images/pop.jpeg",
//         userName: 'Danish',
//         loanType: 'Personal Loan',
//         date: DateTime.now(),
//         icon1: Icons.cancel, 
//         icon2: Icons.check_circle, 
//         status: 'Approved',
//         onPressed: () {
//           // Add your onPressed callback logic here
//         },
//       ),
//        LoanTrack(
//         imageAsset: "assets/images/pop.jpeg",
//         userName: 'Prashma',
//         loanType: 'Personal Loan',
//         date: DateTime.now(),
//         icon1: Icons.check_circle, 
//         icon2: Icons.check_circle, 
//         status: 'Approved',
//         onPressed: () {
//           // Add your onPressed callback logic here
//         },
//       ),
//     ]