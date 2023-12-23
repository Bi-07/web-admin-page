import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth.dart';
import 'home_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase

  await Firebase.initializeApp(
    // Replace with your actual values
    options: FirebaseOptions(
            apiKey: "AIzaSyD1oGQYsd6ftJcuTdZ0cmg_GPLt6PEiB_E",
            authDomain: "flutter-web-login-5ee8c.firebaseapp.com",
            projectId: "flutter-web-login-5ee8c",
            storageBucket: "flutter-web-login-5ee8c.appspot.com",
            messagingSenderId: "267502457052",
            appId: "1:267502457052:web:ef286f22669a8b77b32419"
    ),
  );
  runApp(MyApp());
}

/// We Modify the MyApp to a StatefulWidget.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// To define a method called getUserInfo to invoke the getUser function:
  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  void initState() {
    /// To Call it from the initState method
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      /// for navigate to Home page
      home: HomePage(),
    );
  }
}
