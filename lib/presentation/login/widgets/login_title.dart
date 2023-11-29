import 'package:debet_card_transfer/presentation/global_widgets/custom_title.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: CustomTitle(
        title: 'Login with GSM number',
      ),
    );
  }
}
