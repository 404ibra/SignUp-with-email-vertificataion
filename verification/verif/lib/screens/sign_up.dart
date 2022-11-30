import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:verif/utils/customColors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                headText(),
                SizedBox(
                  height: 130,
                ),
                infoTitle(),
                SizedBox(
                  height: 25,
                ),
                emailTextField("Email"),
                SizedBox(
                  height: 35,
                ),
                passwordTextField("Password"),
                SizedBox(
                  height: 200,
                ),
                customElevatedButton("Next")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding headText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        "Welcome Vefrification \nApplication",
        style: TextStyle(
            color: CustomColors.smoothBlack,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
  }

//Elevated Button "Next_Button" navigator of verifiaction page.. 
  Center customElevatedButton(String buttonText) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
            height: 50,
            width: 350,
            child: ElevatedButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    try {
                      var userResult =
                          await firebaseAuth.createUserWithEmailAndPassword(
                              email: email, password: password);
                    } catch (e) {
                      print(e.toString());
                    }
                  } else {}
                  Navigator.pushReplacementNamed(context, "/verifyPage");
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

  Padding infoTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "Please fill in the required fields completely\nin order to register.",
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }

  Padding emailTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "Required field";
            } else {}
          },
          onSaved: (value) {
            email = value!;
          },
          decoration: textfieldInputDecoration(hintText),
        ),
      ),
    );
  }

  Padding passwordTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return "Required field";
            } else {}
          },
          onSaved: (value) {
            password = value!;
          },
          decoration: textfieldInputDecoration(
            
            hintText),
        ),
      ),
    );
  }

  InputDecoration textfieldInputDecoration(String hintText) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.smoothBlack)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.smoothBlack)),
        hintText: hintText);
  }
}
