import 'package:flutter/material.dart';

Widget InputTextField(
    {required String title,
    TextEditingController? controller,
    String hint = "",
    double height = 50,
    bool? enable,
    TextInputType? keyType,
    Widget? suffixIcon,
    bool isHide = false}) {
  return Container(
    //height: 85.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Container(
          height: height,
          margin: EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(left: 8),
          //     width: 320.w,

          child: TextFormField(
            maxLines: 1,
            controller: controller,
            obscureText: isHide,
            keyboardType: keyType,
            enabled: enable,
            decoration: InputDecoration(
                hintText: hint,
                suffixIcon: suffixIcon,
                hintStyle: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
                border: InputBorder.none),
          ),
        ),
      ],
    ),
  );
}
