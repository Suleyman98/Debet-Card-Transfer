import 'package:debet_card_transfer/app/app_colors.dart';
import 'package:debet_card_transfer/app/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Cannot be blank';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          errorStyle: AppTextStyles.regularBlack.copyWith(color: Colors.amber),
          hintText: label,
          hintStyle: AppTextStyles.regularWhite),
      style: TextStyle(color: AppColors.whiteColor),
    );
  }
}
