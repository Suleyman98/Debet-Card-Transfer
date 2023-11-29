import 'package:debet_card_transfer/app/app_box_decoration.dart';
import 'package:debet_card_transfer/app/app_sized_box.dart';
import 'package:debet_card_transfer/business_logic/cubits/login/login_cubit.dart';
import 'package:debet_card_transfer/business_logic/cubits/register/register_cubit.dart';
import 'package:debet_card_transfer/presentation/global_widgets/custom_elevated_button.dart';
import 'package:debet_card_transfer/presentation/login/screens/login_page.dart';
import 'package:debet_card_transfer/utilities/extensions/card_extensions.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCardForUser extends StatelessWidget {
  const RegisterCardForUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.scaffoldDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CreatedUserCard(),
            AppSizedBox.h40,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShowBack(),
                GetStarted(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShowBack extends StatelessWidget {
  const ShowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool flipCard = false;
    return CustomElevatedButton(
      label: 'Flip to back side',
      onPressed: () {
        flipCard = !flipCard;
        context.read<RegisterCubit>().cardFlip.sink.add(flipCard);
      },
    );
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: 'Login to start',
      onPressed: () {
        context.to(BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginPage(),
        ));
      },
    );
  }
}

class CreatedUserCard extends StatelessWidget {
  const CreatedUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return StreamBuilder(
        stream: cubit.cardFlip.stream,
        initialData: false,
        builder: (context, snapshot) {
          return CreditCard(
            cardNumber: cubit.debitCard.cardNumber,
            cardExpiry: cubit.debitCard.expirationDate,
            cardHolderName: cubit.debitCard.cardHolderName,
            cvv: cubit.debitCard.cvv,
            bankName: "XXX Bank",
            cardType: CardType.masterCard,
            showBackSide: snapshot.data!,
            frontBackground: CardBackgrounds.black,
            backBackground: CardBackgrounds.white,
            showShadow: true,
          );
        });
  }
}
