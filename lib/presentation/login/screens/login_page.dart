import 'package:debet_card_transfer/app/app_box_decoration.dart';
import 'package:debet_card_transfer/app/app_colors.dart';
import 'package:debet_card_transfer/business_logic/cubits/home/home_cubit.dart';
import 'package:debet_card_transfer/business_logic/cubits/login/login_cubit.dart';
import 'package:debet_card_transfer/presentation/home/screens/home.dart';
import 'package:debet_card_transfer/presentation/login/widgets/login_body.dart';
import 'package:debet_card_transfer/presentation/login/widgets/login_title.dart';
import 'package:debet_card_transfer/utilities/extensions/card_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: AppBoxDecoration.scaffoldDecoration,
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          body: Center(
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.isLoading) {
                  context.showCustomSnackBar(
                      'Checking your credentials. Please be patient');
                }
                if (state.hasData == false || state.hasError) {
                  context.showCustomSnackBar('GSM Number is not correct.');
                }
                if (state.hasData) {
                  context.showCustomSnackBar('Login Process was successfull');
                  context.to(BlocProvider(
                    create: (_) =>
                        HomeCubit()..getUsers(context.read<LoginCubit>().gsm),
                    child: const HomeScreen(),
                  ));
                }
              },
              builder: (context, state) {
                return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      LoginTitle(),
                      LoginBody(),
                    ]);
              },
            ),
          ),
        ));
  }
}
