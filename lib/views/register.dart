
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterproject/styles/TextStyles.dart';
import 'package:flutterproject/views/login.dart';
import 'package:flutterproject/widgets/Form_Button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/Form_Element.dart';




class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome !",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.encodeSans(textStyle: TextStyles.headingText),
                ),
              ),
              SizedBox(height: 60),
              _Form(),
              SizedBox(height: 30),
              FormButton(isSingUp: true,),
              SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Already have an account ?",
                      style:GoogleFonts.encodeSans(textStyle: TextStyles.bottomText) ,
                    ),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginPage())
                        );
                      },
                      child:Text(
                        "Sign In",
                        style: GoogleFonts.encodeSans(textStyle: TextStyles.signUpText),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}

class _Form extends StatelessWidget {
  const _Form({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child:Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sign Up",
                style:GoogleFonts.encodeSans(textStyle: TextStyles.authTextStyle) ,
              ),
            ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormElement(hintTitle: "Name",inputType: TextInputType.name,isHalfWidth: true,),
              Spacer(),
              FormElement(hintTitle: "LastName",inputType: TextInputType.name,isHalfWidth: true,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormElement(hintTitle: "E-Mail",inputType: TextInputType.emailAddress,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormElement(hintTitle: "Password",inputType: TextInputType.visiblePassword,),
        ),
      ],
    );
  }
}




