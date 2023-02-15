import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app_sw25/screens/home_screen.dart';
import 'package:social_media_app_sw25/screens/signup_screen.dart';
import 'package:social_media_app_sw25/services/firebase_authentication.dart';


final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: formKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),


                // image
                SizedBox(
                  height: 75,
                  child: OverflowBox(
                    maxHeight: 1000,
                    minHeight: 1000,
                    child: Lottie.asset(
                      "assets/animations/welcome.json",
                    ),
                  ),
                ),
//                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
               SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

/*
                // welcome text
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightGreen,
                    fontStyle: FontStyle.italic,
                  ),
                ),

*/
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),


                // sign in text
                const Text(
                  "Sign in",
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
                // email button
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

                // password button
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



                // sign in button
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  ),
                  onPressed: () async{
                    try {
                      final credential =  await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                      } else if (e.code == 'wrong-password') {
                      }
                    }

                  },
                  child: const Text("Sign in",
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



                // don't have an account and register text
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.225
                    ),

                    // don't have an account text
                    const Text("Don't have an account?  ",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    ),

                    // register text to sign up page
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text("Register",
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



                // google button
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
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.01,
                ),


                // facebook button
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
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.01,
                ),



                SignInButton(
                  Buttons.Email,
                  text: "Continue with E-mail",
                  onPressed: ()  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
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
