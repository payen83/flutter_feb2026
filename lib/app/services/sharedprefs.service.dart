import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? prefs;

  static Future<void> saveData(String key, dynamic value) async{
    final String contactsJson = jsonEncode(value);
    await prefs?.setString(key, contactsJson);
  }

  static Future<List<Map<String, dynamic>>> loadData(String key) async {
    final String contactsJson = prefs?.getString(key) ?? '';
    if(contactsJson.isEmpty){
      return [];
    }
    try {
      final List<dynamic> decoded = jsonDecode(contactsJson);
      return decoded.map((item)=> Map<String, dynamic>.from(item)).toList();
    } catch(e){
      return [];
    }
  }
  static Future clearData(String key) async{
    return await prefs?.remove(key);
  }

}