import 'package:debet_card_transfer/app/app_box_decoration.dart';
import 'package:debet_card_transfer/app/app_colors.dart';
import 'package:debet_card_transfer/business_logic/cubits/register/register_cubit.dart';
import 'package:debet_card_transfer/presentation/register/screens/register_card.dart';
import 'package:debet_card_transfer/presentation/register/widgets/register_body.dart';
import 'package:debet_card_transfer/presentation/register/widgets/register_title.dart';
import 'package:debet_card_transfer/utilities/extensions/card_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.scaffoldDecoration,
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.isLoading) {
              context.showCustomSnackBar(
                  'Registering with your credentials. Please be patient');
            }
            if (state.hasError) {
              context.showCustomSnackBar('Your credentials are not correct.');
            }
            if (state.hasData) {
              context.showCustomSnackBar('Register Process was successfull');
              context.to(BlocProvider.value(
                value: context.read<RegisterCubit>(),
                child: const RegisterCardForUser(),
              ));
            }
          },
          builder: (context, state) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                RegisterTitle(),
                RegisterBody(),
              ],
            );
          },
        ),
      ),
    );
  }
}
