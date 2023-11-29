import 'package:debet_card_transfer/presentation/global_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/register', (route) => false);
      },
      label: 'Don\'t Have an Account?',
    );
  }
}
