import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {

  bool isSingUp;
  final VoidCallback onPressed;


  FormButton({super.key , required this.isSingUp, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      child: Text(
      isSingUp ? "Sign Up" : "Sign In" ,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),

      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF388E3C).withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),

    );
  }
}
