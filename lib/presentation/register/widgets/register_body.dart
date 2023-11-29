import 'package:debet_card_transfer/app/app_paddings.dart';
import 'package:debet_card_transfer/app/app_sized_box.dart';
import 'package:debet_card_transfer/presentation/global_widgets/custom_elevated_button.dart';
import 'package:debet_card_transfer/presentation/global_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubits/register/register_cubit.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: AppPaddings.h40,
            child: Form(
              key:context.read<RegisterCubit>().formKey ,
              child: Column(
                children: [
                  CustomTextField(
                      label: 'Name',
                      controller: context.read<RegisterCubit>().nameController),
                  CustomTextField(
                    controller: context.read<RegisterCubit>().surnameController,
                    label: 'Surname',
                  ),
                  CustomTextField(
                      label: 'Birth Date',
                      controller: context.read<RegisterCubit>().birthDate),
                  CustomTextField(
                      label: 'GCM Number',
                      controller: context.read<RegisterCubit>().gsmController),
                ],
              ),
            ),
          ),
          AppSizedBox.h30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                label: 'Have Account?',
              ),
              CustomElevatedButton(
                onPressed: () {
                  context.read<RegisterCubit>().registerUser();
                },
                label: 'Register',
              ),
            ],
          )
        ],
      ),
    );
  }
}
