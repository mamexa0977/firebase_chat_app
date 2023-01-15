import 'package:firebase_chat_app/Pages/auth/login.dart';
import 'package:firebase_chat_app/Pages/auth/welcome.dart';
import 'package:firebase_chat_app/helper/helper_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyDmnjjI95feaLtPaZOh_TVapPI70Hy1PJo",
      appId: "1:994162316739:web:7127d4b06ad4470b16d976",
      messagingSenderId: "994162316739",
      projectId: "chat-app-876cd",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool _isSignedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _isSignedIn ? HomePage() : WelcomePage(),
    );
  }
}
