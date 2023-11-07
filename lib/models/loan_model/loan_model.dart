import 'package:finkin_credential/res/constants/enums/enums.dart';
import 'package:flutter/material.dart';

class LoanModel {
  final String image;
  final String userName;
  final String loanType;
  final DateTime date;
  final LoanStatus status;

  LoanModel({
    required this.image,
    required this.userName,
    required this.loanType,
    required this.date,
    this.status = LoanStatus.pending
  });

  IconData get icon => loanStatusIcons[status] ?? Icons.no_accounts;

}

final Map<LoanStatus, IconData> loanStatusIcons = {
  LoanStatus.pending: Icons.hourglass_top_outlined,
  LoanStatus.approved: Icons.check_circle,
  LoanStatus.denied: Icons.cancel_outlined
};