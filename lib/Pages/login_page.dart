//
// import 'dart:js';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movieapp/Pages/main_page.dart';
import 'package:movieapp/Pages/register_page.dart';
import '../Components/helper_function.dart';
import '../Components/my_btn.dart';
import '../Components/my_textfield.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  //Log in method
  void logIn() async{
    //show loading circle
    showDialog(
      context: context,
      builder: (context)=>const Center(
        child: CircularProgressIndicator(),
      ),);

    //try sign in
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text,
          password: passwordController.text);

      //pop loading circle
      if(context.mounted) Navigator.pop(context);
      //navigate to home page
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));

    }
    //display any errors
    on FirebaseAuthException catch (e){
      //pop loading circle
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      // resizeToAvoidBottomInset: false,//it is used to avoid keyboard resize

      // appBar: AppBar(
      //   title: Text('Welcome to login page'),
      // ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFcfd9df),
                Color(0xFFe2ebf0),
              ],
            )
        ),
        child: SafeArea(
          //it avoid the notch area at the top
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    maxRadius: 80,

                  ),
                  // Icon(
                  //   Icons.lock,
                  //   size: 100,
                  // ),
                  Text(
                    'Welcome to the login page',
                    style: TextStyle(

                      color: Colors.grey,
                      fontSize: 20,

                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  //user text field
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obsecureText: false,
                    prefixIcon: Icon(Icons.email),
                    obsecuringCharacter: "",
                    suffixIcon: null,
                    keyboardType: TextInputType.emailAddress,


                  ),

                  SizedBox(
                    height: 25,
                  ),
                  //password
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obsecureText: true,
                    prefixIcon: Icon(Icons.lock),
                    obsecuringCharacter: '*',
                    suffixIcon: IconButton(
                      icon:Icon(Icons.remove_red_eye,color: Colors.blue,), onPressed: () {

                    },),
                    keyboardType: null,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    onTap: () {
                      logIn();
                    }, text: 'LogIn',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Text(
                        'Dont have an account?',
                        style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,decorationColor: Colors.grey.shade200),

                      ),
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));

                        },
                        child: Text(
                          'Register here',
                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,decorationColor: Colors.blue),

                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}

