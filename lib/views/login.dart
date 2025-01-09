
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterproject/auth/Auth_Service.dart';
import 'package:flutterproject/styles/TextStyles.dart';
import 'package:flutterproject/views/home.dart';
import 'package:flutterproject/views/register.dart';
import 'package:flutterproject/widgets/Form_Element.dart';
import 'package:google_fonts/google_fonts.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   AuthService authService = AuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> signIn()async{
    String email = emailController.text;
    String password = passwordController.text;

    if(_validateForm(email, password)) {
      final user = await authService.signIn(email, password);
      _goHomePage(user!.id);
    }else{
      print("Form geçersiz.");
    }

  }


   Future<void> _goHomePage(String authId) async{

     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(authId: authId,)));

   }

  bool _validateForm(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
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
        title: Text("Sign in"),
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
              _Form(emailController: emailController,passwordController: passwordController,),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: signIn,
                child: Text(
                  "Sign in",
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
              ),
              SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Don't have an account ?",
                      style:GoogleFonts.encodeSans(textStyle: TextStyles.bottomText) ,
                    ),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const RegisterPage())
                        );
                      },
                      child:Text(
                        "Sign Up",
                        style: GoogleFonts.encodeSans(textStyle: TextStyles.signUpText),
                      ),
                    ),
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
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _Form({super.key, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "Sign In",
                 style:GoogleFonts.encodeSans(textStyle: TextStyles.authTextStyle) ,

            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormElement(
            hintTitle: "E-Mail",
            controller: emailController,
            inputType: TextInputType.emailAddress,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormElement(
            hintTitle: "Password",
            controller: passwordController,
            inputType: TextInputType.visiblePassword,
          ),
        ),
      ],

    );
  }
}


