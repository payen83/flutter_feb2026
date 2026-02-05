import 'package:flutter/material.dart';
import 'package:flutter_feb2026/app/app.dart';
import 'package:flutter_feb2026/app/services/sharedprefs.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
