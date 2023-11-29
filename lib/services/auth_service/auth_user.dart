import 'dart:convert';
import 'package:debet_card_transfer/services/auth_service/auth_provider.dart';
import 'package:debet_card_transfer/services/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUser implements AuthProvider {
  @override
  String usersKey = 'users';

  @override
  Future<void> createUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> userListJson = prefs.getStringList(usersKey) ?? [];
    userListJson.add(jsonEncode(user.toJson()));
    await prefs.setStringList(usersKey, userListJson);
  }

  @override
  Future<bool> loginUser(String gsm) async {
    final UserModel? user = await getUser(gsm);
    if (user != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('login', true);
      prefs.setString('gsm', gsm);
    }

    return user != null;
  }

  @override
  Future<UserModel?> getUser(String gsm) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<UserModel> userJson = prefs.getStringList(usersKey)!.map((e) {
      final Map<String, dynamic> userMap = jsonDecode(e);
      return UserModel.fromJson(userMap);
    }).toList();

    return userJson.firstWhere((element) => element.gsmNumber == gsm);
  }

  @override
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', false);
  }
}
