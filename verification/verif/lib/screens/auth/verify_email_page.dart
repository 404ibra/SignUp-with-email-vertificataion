import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/customColors.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late User user;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height:250),
            headText(),
            SizedBox(height:250),

            customElevatedButton("Back sign up page")
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      Navigator.pushReplacementNamed(context, "/homePage");
    } else {}
  }

  Center customElevatedButton(String buttonText) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
            height: 50,
            width: 350,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/signUpPage");
                },
                child: Text(
                  buttonText,
                  style: TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  backgroundColor: CustomColors.smoothBlack,
                ))),
      ),
    );
  }

    Padding headText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        "An email has been sent to \n${user.email} \nplease check it",
        style: TextStyle(
            color: CustomColors.smoothBlack,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
