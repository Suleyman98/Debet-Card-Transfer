import 'package:debet_card_transfer/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 
  bool? isLoggedIn = prefs.getBool('login');
  String? gsm = prefs.getString('gsm') ?? '';

  runApp(MyApp(
    gsm: gsm,
    isLoggedIn: isLoggedIn != null && isLoggedIn == true,
  ));
}
