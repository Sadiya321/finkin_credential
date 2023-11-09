import 'package:finkin_credential/res/image_asset/image_asset.dart';
import 'package:flutter/material.dart';

class Category {
  final String imagePath;
  final String text;

  Category({required this.imagePath, required this.text});
}

List<Category> categories = [
  Category(
    imagePath:ImageAsset.education,
    text: 'Home Loan',
  ),
  Category(
    imagePath: ImageAsset.education,
    text: 'Business Loans ',
  ),
  Category(
   imagePath: ImageAsset.education,
    text: 'Education Loan',
  ),
  Category(
    imagePath: ImageAsset.education,
    text: 'Bank Loan',
  ),
   Category(
    imagePath: ImageAsset.education,
    text: ' Personal Loans',
  ),
   Category(
    imagePath: ImageAsset.education,
    text: ' car Loans',
  ),
];