import 'package:debet_card_transfer/presentation/global_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubits/login/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        context.read<LoginCubit>().login();
      },
      label: 'Login',
    );
  }
}
