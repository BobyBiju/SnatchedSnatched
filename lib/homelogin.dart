import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth=FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneNoController=TextEditingController();
  TextEditingController referralCodeController=TextEditingController();

  bool showSpinner=false;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 150.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Snatched',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: phoneNoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact Number',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: referralCodeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Referral Code',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffdb901f), // Background color
                      ),
                      child: const Text('Sign Up'),
                      // onPressed: () {
                      //   print(nameController.text);
                      //   print(passwordController.text);
                      // },
                      onPressed: () async{
                        setState(() {
                          showSpinner=true;
                        });



                        try {
                          final newUser = await _auth.createUserWithEmailAndPassword(
                              email: emailController.text, password: passwordController.text);
                          if(newUser!=null){
                            print(nameController.text);
                            print(passwordController.text);
                            // Navigator.pushNamed(context, EmployeeProfileCreation.id);
                          }
                          setState(() {
                            showSpinner=false;
                          });

                        } catch(e)
                        {print(e);}
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Already have an account?'),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Gesture detector for facebook Login
                    GestureDetector(
                      onTap: () {
                        // Call facebook login methon
                        // AuthService().signInWithFacebook();
                      },
                      child: Image(
                          width: 50, image: AssetImage('images/facebook.png')),
                    ),
                    SizedBox(width: 50),
                    // Gesture detector for the Google icon
                    GestureDetector(
                        onTap: () {
                          // Call the a method to sign in with Google
                          // AuthService().signInWithGoogle();
                        },
                        child: Image(
                            width: 55, image: AssetImage('images/google.jpg'))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
