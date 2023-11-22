import 'package:finkin_credential/res/image_asset/image_asset.dart';
import 'package:flutter/material.dart';

import '../../../pages/loan_information/loan_form.dart';

class Category {
  final String imagePath;
  final String text;
  final void Function(BuildContext)? onTap;
  Category({required this.imagePath, required this.text, required this.onTap});
}

List<Category> categories = [
  Category(
    imagePath: ImageAsset.education,
    text: 'Home Loan',
    onTap: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoanForm(title: 'Home Loan'),
        ),
      );
    },
  ),
  Category(
    imagePath: ImageAsset.education,
    text: 'Business Loans ',
    onTap: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoanForm(title: 'Business Loan'),
        ),
      );
    },
  ),
  Category(
    imagePath: ImageAsset.education,
    text: 'Education Loan',
    onTap: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoanForm(title: 'Education Loan'),
        ),
      );
    },
  ),
  Category(
    imagePath: ImageAsset.education,
    text: 'Bank Loan',
    onTap: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoanForm(title: 'Bank Loan'),
        ),
      );
    },
  ),
  Category(
    imagePath: ImageAsset.education,
    text: ' Personal Loans',
    onTap: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoanForm(title: 'Personal Loan'),
        ),
      );
    },
  ),
  Category(
    imagePath: ImageAsset.education,
    text: ' Car Loans',
    onTap: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoanForm(title: 'Car Loan'),
        ),
      );
    },
  ),
];
