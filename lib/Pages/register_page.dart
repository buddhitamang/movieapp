import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Components/helper_function.dart';
import '../Components/my_btn.dart';
import '../Components/my_textfield.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key,});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
//
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPwController = TextEditingController();

  //register method
  void registerUser() async{

    //show loading circle
    showDialog(
        context: context,
        builder: (context)=>const Center(
          child: CircularProgressIndicator(),
        )
    );

    //make sure password match
    if(passwordController.text !=confirmPwController.text){
      //pop loading circle
      Navigator.pop(context);

      //show error message to user
      displayMessageToUser("password do not match", context);
    }
    //if password do match
    else{
      //try creating the user
      try{
        //create the user
        UserCredential? userCredential=
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:emailController.text,
          password:passwordController.text,
        );
        //pop loading circle
        Navigator.pop(context);
        displayMessageToUser("registered succesfully", context);

      }on FirebaseAuthException catch (e) {
        //pop loading circle
        Navigator.pop(context);

        //display error message to user
        displayMessageToUser(e.code, context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      // resizeToAvoidBottomInset: false,

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
                    'Welcome to the Register page',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,

                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
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

                  //user text field
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obsecureText: false,
                    prefixIcon: Icon(Icons.verified_user),
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
                    suffixIcon: null,
                    keyboardType: null,
                  ),


                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    controller: confirmPwController,
                    hintText: 'Confirm Passoword',
                    obsecureText: true,
                    prefixIcon: Icon(Icons.lock),
                    obsecuringCharacter: "*",
                    suffixIcon: null,
                    keyboardType: TextInputType.emailAddress,


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
                    // Text: "Register",
                    onTap: () {
                      registerUser();
                    }, text: 'Register',
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
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,decorationColor: Colors.grey.shade200),

                      ),
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                        },
                        child: Text(
                          'Login here',
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
