import 'package:debet_card_transfer/presentation/global_widgets/custom_title.dart';
import 'package:flutter/material.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: CustomTitle(title: 'Register for quickest \ntransfers ever!'),
    );
  }
}
