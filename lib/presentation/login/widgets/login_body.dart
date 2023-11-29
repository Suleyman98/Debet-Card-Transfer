import 'package:debet_card_transfer/app/app_paddings.dart';
import 'package:debet_card_transfer/app/app_sized_box.dart';
import 'package:debet_card_transfer/presentation/global_widgets/custom_text_field.dart';
import 'package:debet_card_transfer/presentation/login/widgets/login_button.dart';
import 'package:debet_card_transfer/presentation/login/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubits/login/login_cubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: AppPaddings.h40,
          child: Column(
            children: [
              CustomTextField(
                  label: 'GSM Number',
                  controller: context.read<LoginCubit>().gsmController),
              AppSizedBox.h40,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [LoginButton(), RegisterButton()],
              )
            ],
          ),
        ));
  }
}
