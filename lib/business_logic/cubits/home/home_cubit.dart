import 'dart:developer' as log;
import 'dart:math' as math;

import 'package:debet_card_transfer/services/auth_service/auth_user.dart';
import 'package:debet_card_transfer/services/manager_service/manager_service.dart';
import 'package:debet_card_transfer/services/models/debit_card_model.dart';
import 'package:debet_card_transfer/services/models/user_model.dart';
import 'package:debet_card_transfer/utilities/extensions/card_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  late List<UserModel> users;
  late UserModel currentUser;

  void getUsers(String gsm) async {
    try {
      users = await ManagerService().getUsers();
      currentUser = await ManagerService().getUser(gsm);
      users = users
          .where((element) => element.gsmNumber != currentUser.gsmNumber)
          .toList();

      emit(HomeLoaded(users: users, currentUser: currentUser));
    } catch (e) {
      log.log(e.toString());
    }
  }

  Future<void> transferMoney(
      double amount, UserModel user, BuildContext context) async {
    try {
      if (user.debitCard.balance == -1) {
        context.showCustomSnackBar('This user did not add the Debit Card',
            durationSeconds: 2);
        return;
      }
      if (currentUser.debitCard.balance >= amount) {
        await ManagerService().updateUserBalance(user, amount);
        users = await ManagerService().getUsers();
        users = users
            .where((element) => element.gsmNumber != currentUser.gsmNumber)
            .toList();
        await ManagerService().updateUserBalance(currentUser, -amount);
        currentUser = await ManagerService().getUser(currentUser.gsmNumber);
        emit(HomeLoaded(users: users, currentUser: currentUser));
        if (context.mounted) {
          context.showCustomSnackBar('Transfer is successfull!',
              durationSeconds: 1);
        }
      } else if (currentUser.debitCard.balance == -1) {
        context.showCustomSnackBar(
            'You can\'t transfer money. Please add new Debit Card to continue!',
            durationSeconds: 2);
      } else {
        context.showCustomSnackBar(
            'Your balance is not enough for this operation!',
            durationSeconds: 1);
      }
    } catch (e) {
      log.log(e.toString());
    }
  }

  void deleteDebitCard() async {
    await ManagerService().deleteDebit(currentUser);
    currentUser = await ManagerService().getUser(currentUser.gsmNumber);
    emit(HomeLoaded(users: users, currentUser: currentUser));
  }

  void addDebitCard() async {
    DebitCardModel debit = createDebitCardForUser(currentUser);
    await ManagerService().addDebit(currentUser, debit);
    currentUser = await ManagerService().getUser(currentUser.gsmNumber);
    emit(HomeLoaded(users: users, currentUser: currentUser));
  }

  void logout(BuildContext context) async {
    AuthUser().logout();
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
  }

  DebitCardModel createDebitCardForUser(UserModel user) {
    return DebitCardModel(
        balance: 10,
        cardNumber: math.Random().generateRandomBankAccountNumber(),
        cardHolderName: user.name,
        expirationDate: DateTime.now()
            .add(const Duration(days: 60))
            .toIso8601String()
            .substring(0, 10),
        cvv: '123');
  }
}
