import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:verif/screens/auth/verify_email_page.dart';
import 'package:verif/screens/home_page.dart';
import 'package:verif/screens/sign_up.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/homePage":(context) => HomePageView(),
        "/verifyPage":(context) => VerifyEmailPage(),
        "/signUpPage":(context) => SignUp(),

        },
      theme: ThemeData(),
      home: SignUp(),
    );
  }
}
