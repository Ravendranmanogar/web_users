import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 100.w,
    height: 100.h,
    //color: Colors.white,
  );
}

TextField reusableTextField(String text,bool ispasswordtype,TextEditingController controller){//IconData icon,
  return TextField(
    controller: controller,
    obscureText: ispasswordtype,
    cursorColor: Colors.white,
    enableSuggestions: !ispasswordtype,
    autocorrect: !ispasswordtype,
    style: TextStyle(color: Colors.white,fontSize: 14.sp),
    decoration: InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10),),
        borderSide: BorderSide(color: Colors.white24),
      ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10),),
          borderSide: BorderSide(color: Colors.white38),
        ),
        //prefixIcon: Icon(icon,color: Colors.white70,),
        hintText: text,

        //labelText: text,
        hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
        filled: true,
        fillColor: Colors.black12,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(style: BorderStyle.solid,width: 15.w)
        )
    ),

    keyboardType: ispasswordtype
        ? TextInputType.visiblePassword: TextInputType.emailAddress,
  );
}
// Container SignInSignUpButton(BuildContext context,bool isLogin, Function onTap){
//   return
// }
