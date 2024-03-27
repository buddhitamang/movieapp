import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> signOut() async {
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacementNamed('/login');
      } catch (e) {
        print("Error signing out: $e");
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 90,

                      backgroundImage: AssetImage('lib/images/profileimage.jpg')),
                    Text('Buddhi Tamang',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Container(
                height: 40,
                  width: double.infinity,
                  // color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.question_mark_sharp),
                          Text('About',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  )),
              SizedBox(height: 10,),
              Container(
                  height: 40,
                  width: double.infinity,
                  // color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.settings),
                          Text('Settings',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  )),
              SizedBox(height: 10,),

              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (context)=>AlertDialog(
                    title: Text('Are you sure you want to logout'),
                    actions: [
                      MaterialButton(onPressed: (){
                       signOut();
                        Navigator.pop(context);
                      },child: Text('Yes'),),
                      MaterialButton(onPressed: (){
                        Navigator.pop(context);
                      },child: Text('NO'),)
                    ],
                  ));
                },
                child: Container(
                    height: 40,
                    width: double.infinity,
                    // color: Colors.blue,
                    child: Row(
                      children: [
                        Icon(Icons.logout_sharp),
                        Text('LogOut',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                      ],
                    )),
              ),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
