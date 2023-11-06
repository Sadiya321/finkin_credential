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
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imageAsset),
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
                            style: const TextStyle(fontSize: 16),
                            maxLines: 2,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            loanType,
                            style: const TextStyle(fontSize: 10),
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
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formattedDate, // Display the formatted date
                      style: const TextStyle(fontSize: 12),
                    ),
                    // Icon(
                    //   icon1,
                    //   color: Colors.blue, // Change the color as needed
                    // ),
                    Text(
                      status,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
