import 'package:debet_card_transfer/app/app_box_decoration.dart';
import 'package:debet_card_transfer/app/app_colors.dart';

import 'package:debet_card_transfer/business_logic/cubits/home/home_cubit.dart';
import 'package:debet_card_transfer/presentation/home/widgets/home_drawer.dart';
import 'package:debet_card_transfer/services/models/user_model.dart';
import 'package:debet_card_transfer/presentation/home/widgets/home_appbar.dart';
import 'package:debet_card_transfer/presentation/home/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.scaffoldDecoration,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          double? balance =
              state is HomeLoaded ? state.currentUser.debitCard.balance : 0;
          return Scaffold(
              drawer: const HomeDrawer(),
              floatingActionButton: DebitCardButton(balance: balance),
              appBar: HomeAppBar(balance: balance),
              backgroundColor: AppColors.transparent,
              body: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoaded) {
                    List<UserModel> users = state.users;
                    return Column(
                      children: [
                        Expanded(
                          child: UserList(users: users),
                        ),
                      ],
                    );
                  } else if (state is HomeError) {
                    return const Center(
                      child: Text('Error Occured'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ));
        },
      ),
    );
  }
}

class DebitCardButton extends StatelessWidget {
  const DebitCardButton({
    super.key,
    required this.balance,
  });

  final double? balance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (balance == -1) const AddDeleteDebitCard(delete: false),
        if (balance != -1) const AddDeleteDebitCard(delete: true),
      ],
    );
  }
}

class AddDeleteDebitCard extends StatelessWidget {
  final bool delete;
  const AddDeleteDebitCard({
    super.key,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        icon: delete ? const Icon(Icons.close) : const Icon(Icons.add),
        onPressed: () {
          if (delete) {
            context.read<HomeCubit>().deleteDebitCard();
          } else {
            context.read<HomeCubit>().addDebitCard();
          }
        },
        label: Text(delete ? 'Delete Card' : 'Add Card'));
  }
}
