import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:say_hello_chat/screens/chat_screen.dart';

import '../constant.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_text_form.dart';
import '../widgets/custum_Buton.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  static String id = "signUP";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? email;

  String? password;

  GlobalKey<FormState> validateKeey = new GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: Form(
            key: validateKeey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  'assets/images/q3.png',
                  height: 110,
                  width: 110,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Say hello chat",
                      style: GoogleFonts.average(fontSize: 30),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: const [
                    Text(
                      "SignUp",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'Email',
                  onChangedd: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  onChangedd: (value) {
                    password = value;
                  },
                  obscureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                customButton(
                  title: "SignUP",
                  onTap: () async {
                    if (validateKeey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await signUpUser();
                        Navigator.of(context).pushNamed(ChatScreen.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, "The password is too weak");
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              "The account already exists for that email.");
                        }
                        cath(x) {
                          showSnackBar(context, "There is an error");
                        }
                      }
                      setState(() {
                        isLoading = false;
                      });
                    } else {}
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        " Login",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUpUser() async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
