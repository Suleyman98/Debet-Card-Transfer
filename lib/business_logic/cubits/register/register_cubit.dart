import 'dart:async';
import 'dart:math';

import 'package:debet_card_transfer/services/auth_service/auth_user.dart';
import 'package:debet_card_transfer/services/models/debit_card_model.dart';
import 'package:debet_card_transfer/services/models/user_model.dart';
import 'package:debet_card_transfer/utilities/extensions/card_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(RegisterState(isLoading: false, hasError: false, hasData: false));
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController gsmController = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  final StreamController<bool> cardFlip = StreamController<bool>();
  final formKey = GlobalKey<FormState>();
  final uuid = const Uuid();

  String get name => nameController.text;
  String get surname => surnameController.text;
  String get gsm => gsmController.text;
  Random random = Random();
  late DebitCardModel debitCard;

  void registerUser() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(RegisterState(isLoading: true, hasError: false, hasData: false));
    try {
      createDebitCardForUser();
      AuthUser().createUser(UserModel(
          id: uuid.v1(),
          name: name,
          surname: surname,
          debitCard: debitCard,
          birthDate: birthDate.text,
          gsmNumber: gsm));
      emit(RegisterState(isLoading: false, hasError: false, hasData: true));
    } catch (e) {
      emit(RegisterState(isLoading: false, hasError: true, hasData: false));
    }
  }

  void createDebitCardForUser() {
    debitCard = DebitCardModel(
        balance: 10,
        cardNumber: random.generateRandomBankAccountNumber(),
        cardHolderName: '$name $surname',
        expirationDate: DateTime.now()
            .add(const Duration(days: 60))
            .toIso8601String()
            .substring(0, 10),
        cvv: '123');
  }
}
