import 'package:debet_card_transfer/services/auth_service/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginState(hasData: false, hasError: false, isLoading: false));
  final TextEditingController gsmController = TextEditingController();
  String get gsm => gsmController.text;
  void login() async {
    try {
      bool userExists = await AuthUser().loginUser(gsm);
      emit(LoginState(isLoading: false, hasError: false, hasData: userExists));
    } catch (e) {
      emit(LoginState(isLoading: false, hasError: true, hasData: false));
    }
  }
}
