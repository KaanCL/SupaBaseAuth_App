import 'package:flutter/material.dart';
import 'package:flutterproject/styles/TextStyles.dart';
import 'package:google_fonts/google_fonts.dart';

class FormElement extends StatelessWidget {

  final hintTitle;
  bool isHalfWidth;
  final TextInputType inputType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;


   FormElement({super.key ,required this.hintTitle,required this.inputType , this.isHalfWidth=false, this.controller, this.onChanged });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (isHalfWidth ? 0.40 : 0.9)  ,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFF388E3C).withOpacity(0.7)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 9.0),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: inputType,
          obscureText: hintTitle == "Password" ? true : false,
          style: TextStyle(color: Colors.white),
          decoration:InputDecoration(
              hintText: hintTitle,
              hintStyle: GoogleFonts.encodeSans(textStyle: TextStyles.formElementText),
              border: InputBorder.none
          ),
        ),
      ),

    );
  }

}