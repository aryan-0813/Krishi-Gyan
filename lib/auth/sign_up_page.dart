import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './http_exception.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Future<void> _signUpUsingEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        throw HttpException('Weak Password');
      }
      if (error.code == 'email-already-in-use') {
        throw HttpException('Email already in use');
      }
    } catch (_) {
      throw HttpException('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
      ),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext ctx, AsyncSnapshot<User?> user) {
            if (user.data?.uid != null) {
              return Center(
                child: Text('User uid: ${user.data?.uid}'),
              );
            }
            return Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _signUpUsingEmailPassword(
                        'test@gmail.com', 'email@123'),
                    child: Text('Sign up using email password'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Sign up using google'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Sign up using facebook'),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
