import 'package:debet_card_transfer/services/models/user_model.dart';

abstract class ManagerProvider {
  String get usersKey;

  set usersKey(String value) {
    usersKey = value;
  }

  Future<UserModel?> getUser(String gsm);
  Future<void> updateUserBalance(UserModel user, double amount);
  Future<void> updateUser(Map<String, dynamic> user);
  Future<List<UserModel>> getUsers();
  Future<List<String>> fetchUsers();
}
