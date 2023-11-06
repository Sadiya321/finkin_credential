import 'dart:io';

import 'package:finkin_credential/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanTrack extends StatelessWidget {
  final String imageAsset;
  final String userName;
  final String loanType;
  final DateTime date;
  final IconData icon1;
  final IconData icon2;
  final String status;
  final Function() onPressed;

  const LoanTrack({
    super.key,
    required this.imageAsset,
    required this.userName,
    required this.loanType,
    required this.onPressed,
    required this.date,
    required this.icon1,
    required this.icon2,
    required this.status,
    
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMd().format(date);

    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
  color: AppColor.textLight,
  borderRadius: BorderRadius.circular(26),
  border: Border.all(
    color: Colors.black,
    width: 1.0, // Adjust the width as needed for the thickness of the border
 
  ),),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:AssetImage(imageAsset),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: TextStyle(fontSize: 16),
                            maxLines: 2,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            loanType,
                            style: TextStyle(fontSize: 10),
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
               const SizedBox(
                        width: 18,
                      ),
              Row(
                      children: [
                        Icon(
                            icon1,
                            color: AppColor.icon,
                          ),
                      ],
                    ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    
                   Column(
                    children: [
                      // Icon(
                      //   icon1,
                      //   color: Colors.blue,
                      // ),
                      const SizedBox(
                        width: 12,
                      ),
                    Text(
                      formattedDate, // Display the formatted date
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      status,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                   ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
