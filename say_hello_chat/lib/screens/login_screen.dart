import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:say_hello_chat/screens/sign_up.dart';

import '../constant.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_text_form.dart';
import '../widgets/custum_Buton.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> validateKey = GlobalKey();

  String? email;

  String? password;
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
            autovalidateMode: AutovalidateMode.always,
            key: validateKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  'assets/images/q3.png',
                  height: 110,
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
                      "LOGIN",
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
                  obscureText: true,
                  onChangedd: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                customButton(
                    title: "LOGIN",
                    onTap: () async {
                      if (validateKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                      }
                      try {
                        await signInUser();
                        Navigator.of(context).pushNamed(ChatScreen.id,arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, "No user found for that email.");
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              "Wrong password provided for that user.");
                        }
                      } catch (x) {
                        showSnackBar(context, "There was an error");
                      }
                      isLoading = false;
                      setState(() {});
                    }),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "If you don\'t have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUp.id);
                      },
                      child: const Text(
                        " Click here",
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

  Future<void> signInUser() async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
