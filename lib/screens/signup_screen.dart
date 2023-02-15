import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app_sw25/screens/home_screen.dart';
import 'package:social_media_app_sw25/screens/info_screen.dart';
import 'package:social_media_app_sw25/screens/login_screen.dart';

import '../services/firebase_authentication.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController passwordAgainController = TextEditingController();

final GlobalKey<FormState> formKey = GlobalKey();

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[

                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),


                // animation
                SizedBox(
                  height: 75,
                  child: OverflowBox(
                    maxHeight: 1000,
                    minHeight: 1000,
                    child: Lottie.asset(
                      "assets/animations/sign_in_success.json",
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),




                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightGreen,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),


                // sign up text
                const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),


                // sign in buttons
                // email field
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),


                // password field
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),


                // password again field
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: passwordAgainController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Confirm your password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),



                // sign up button
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  ),
                  onPressed: () {
                    try {
                      final credential =
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InfoPage()),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }

                  },
                  child: const Text("Sign Up",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),


                // already have an account and sign in text
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.225
                    ),

                    // don't have an account text
                    const Text("Already have an account?  ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),

                    // register text to sign up page
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text("Sign in",
                        style: TextStyle(
                          color: Colors.lightGreen,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),),
                    ),

                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.02,
                ),


                // Or text
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width *0.38,
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.05,
                      height: 1,
                    ),

                    const Text("Or",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                      ),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.05,
                      height: 1,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width *0.38,
                      color: Colors.grey,
                    ),

                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.02,
                ),




                // sign in with google
                SignInButton(
                  Buttons.Google,
                  text: "Continue with Google",
                  onPressed: () async {
                    await Auth.instance.signInWithGoogle();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                    );
                  },
                ),

                // sign in with facebook
                SignInButton(
                  Buttons.Facebook,
                  text: "Continue with Facebook",
                  onPressed: () async {
                    await Auth.instance.signInWithFacebook();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                    );
                  },
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
