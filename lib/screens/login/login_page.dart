// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _signUpUsingEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        // change it later to custom exceptions or toast
        print('weak password');
      }
      if (error.code == 'email-already-in-use') {
        // change it later to custom exceptions or toast
        print('email already in use!');
      }
    } catch (_) {
      // change it later to custom exceptions or toast
      print('something went wrong');
    }
  }

  Future<void> _signUpUsingGoogleAccount() async {
    GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();

    if (googleAccount == null) {
      // change it later to custom exceptions or toast
      print('something went wrong');
      return Future.value(null);
    }

    print('Successfull!!');
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Hello again!
            Text(
              'Hello Bruh!',
              style: GoogleFonts.kufam(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You have been missed!',
              style: GoogleFonts.bentham(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),

            //email text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            //password text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    // controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            //sign in
            SizedBox(
              height: 50,
              width: 375,
              child: ElevatedButton(
                onPressed: () => _signUpUsingEmailPassword(
                    emailController.text, passwordController.text),
                child: const Text('Sign In'),
                style: ElevatedButton.styleFrom(
                  elevation: 40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: Container(
            //     padding: EdgeInsets.all(20.0),
            //     decoration: BoxDecoration(
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(12)),
            //     child: Center(
            //       child: Text(
            //         'Sign In',
            //         style: GoogleFonts.basic(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 18,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),

            //not a member

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a Member? '),
                SizedBox(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                      child: const Text(' Register Here!')),

                  //   style: TextStyle(
                  //       color: Colors.blue, fontWeight: FontWeight.bold),
                  // ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
                      height: 40,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook,
                          size: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 60,
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () => _signUpUsingGoogleAccount(),
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          size: 48,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
