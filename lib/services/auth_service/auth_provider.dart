import 'package:debet_card_transfer/services/models/user_model.dart';

abstract class AuthProvider {
  String get usersKey;

  set usersKey(String value) {
    usersKey = value;
  }

  Future<void> createUser(UserModel user);

  Future<bool> loginUser(String gsm);
  Future<UserModel?> getUser(String gsm);

  Future<void> logout();
}
