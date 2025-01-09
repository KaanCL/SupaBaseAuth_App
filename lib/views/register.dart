
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterproject/auth/Auth_Service.dart';
import 'package:flutterproject/styles/TextStyles.dart';
import 'package:flutterproject/views/home.dart';
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
  AuthService authService = AuthService();


  TextEditingController  nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> _register() async {
    authService.getCurrentUser();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if(_validateForm(name, lastName, email, password)){
     final user = await authService.signUp(name, lastName, email, password);

     _goHomePage(user!.id);

     await authService.getUser(user!.id);

    }else{
      print("Form geçersiz.");
    }

  }

  Future<void> _goHomePage(String authId) async{

    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(authId: authId,)));

  }


  bool _validateForm(String name, String lastName, String email, String password) {
    if (name.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty) {
      return false;
    }
    if (!RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email)) {
      return false;
    }
    if (password.length < 6) {
      return false;
    }
    return true;
  }

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
              _Form(
                nameController: nameController,
                lastNameController: lastNameController,
                emailController: emailController,
                passwordController: passwordController,
              ),
              SizedBox(height: 30),
              FormButton(isSingUp: true,onPressed: _register,),
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

  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _Form({super.key, required this.nameController, required this.lastNameController, required this.emailController, required this.passwordController});

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
              FormElement(
                hintTitle: "Name",
                inputType: TextInputType.name,
                isHalfWidth: true,
                controller: nameController,

              ),
              Spacer(),
              FormElement(
                hintTitle: "LastName",
                inputType: TextInputType.name,
                isHalfWidth: true,
                controller: lastNameController,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormElement(
            hintTitle: "E-Mail",
            inputType: TextInputType.emailAddress,
            controller: emailController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormElement(
            hintTitle: "Password",
            inputType: TextInputType.visiblePassword,
            controller: passwordController,
          ),
        ),
      ],
    );
  }
}




