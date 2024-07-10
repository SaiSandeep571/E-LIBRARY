import 'package:e_library/Screens/AdminHome.dart';
import 'package:e_library/Screens/home.dart';
import 'package:e_library/firebase_options.dart';
import 'package:e_library/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

String email = "";
String? log;
bool isAdmin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  email = pref.getString("EMAIL").toString();
  log = pref.getString("LOGIN");
  isAdmin = (pref.getString("USR_TYPE") == "IN");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: (log == "IN")
            ? (isAdmin)
                ? AdminHome()
                : Home()
            : Loginscreen());
  }
}
