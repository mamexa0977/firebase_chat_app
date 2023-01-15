import 'package:firebase_chat_app/Pages/home.dart';
import 'package:firebase_chat_app/Pages/auth/login.dart';
import 'package:firebase_chat_app/helper/helper_functions.dart';
import 'package:firebase_chat_app/service/auth.dart';
import 'package:flutter/material.dart';

import '../../helper/helper_functions.dart';
import '../../widget/custom_text_fields.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String password = "";
  String email = "";
  String name = "";
  bool isLoading = false;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: formkey,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: nameController,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Name cant be empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "full Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFee7b64), width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFee7b64), width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFee7b64), width: 2),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                          top: 12,
                          bottom: 12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: emailController,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },

                      // check tha validation
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val!)
                            ? null
                            : "Please enter a valid email";
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFee7b64), width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFee7b64), width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFee7b64), width: 2),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                          top: 12,
                          bottom: 12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (val) {
                        if (val!.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFee7b64), width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFee7b64), width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFee7b64), width: 2),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                          top: 12,
                          bottom: 12,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Signup();
                      },
                      child: Text('sign up')),
                ],
              )),
            ),
    );
  }

  Signup() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(name, email, password)
          .then((value) async {
        if (value == true) {
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(name);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));

          //saving user data

        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}
