import 'dart:convert';
import 'package:debet_card_transfer/services/manager_service/manager_provider.dart';
import 'package:debet_card_transfer/services/models/debit_card_model.dart';
import 'package:debet_card_transfer/services/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagerService implements ManagerProvider {
  @override
  String usersKey = 'users';

  @override
  Future<void> updateUserBalance(UserModel user, double amount) async {
    user.debitCard.balance += amount;

    updateUser(user.toJson());
  }

  Future<void> deleteDebit(UserModel user) async {
    user.debitCard = DebitCardModel(
        balance: -1,
        cardNumber: '',
        cardHolderName: '',
        expirationDate: '',
        cvv: '');

    updateUser(user.toJson());
  }

  Future<void> addDebit(UserModel user, DebitCardModel debit) async {
    user.debitCard = debit;
    updateUser(user.toJson());
  }

  @override
  Future<void> updateUser(Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> userListJson = await fetchUsers();
    Map<String, dynamic> updatedUser = user;
    userListJson = userListJson.map((e) {
      Map<String, dynamic> currentUser = jsonDecode(e);
      if (currentUser['gsmNumber'] == updatedUser['gsmNumber']) {
        e = jsonEncode(updatedUser);
      }
      return e;
    }).toList();
    prefs.setStringList(usersKey, userListJson);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    List<String> userListJson = await fetchUsers();
    final List<UserModel> users = userListJson.map((json) {
      final Map<String, dynamic> userMap = jsonDecode(json);
      return UserModel.fromJson(userMap);
    }).toList();

    return users;
  }

  @override
  Future<List<String>> fetchUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> userListJson = prefs.getStringList(usersKey) ?? [];
    return userListJson;
  }

  @override
  Future<UserModel> getUser(String gsm) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<UserModel> userJson = prefs.getStringList(usersKey)!.map((e) {
      final Map<String, dynamic> userMap = jsonDecode(e);
      return UserModel.fromJson(userMap);
    }).toList();
    return userJson.firstWhere((element) => element.gsmNumber == gsm);
  }
}
