import 'dart:math';

import 'package:flutter/material.dart';

extension RandomBankAccountNumber on Random {
  String generateRandomBankAccountNumber() {
    String accountNumber = '';

    for (int i = 0; i < 16; i++) {
      accountNumber += nextInt(10).toString();
    }

    return accountNumber;
  }
}

extension SnackBarExtension on BuildContext {
  void showCustomSnackBar(String message, {int durationSeconds = 3}) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: durationSeconds),
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}

extension NavigationExtension on BuildContext {
  void to(Widget page) {
    Navigator.pushAndRemoveUntil(this, MaterialPageRoute(
      builder: (_) {
        return page;
      },
    ), (route) => false);
  }
}
