import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> signOut() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  exit(0);
}
