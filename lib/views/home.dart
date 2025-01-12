import 'package:flutter/material.dart';
import 'package:flutterproject/SharedPrefence_Service.dart';
import 'package:flutterproject/auth/Auth_Service.dart';
import 'package:flutterproject/styles/TextStyles.dart';
import 'package:flutterproject/views/login.dart';
import 'package:flutterproject/widgets/Card_Button.dart';
import 'package:flutterproject/widgets/Form_Button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/User_Model.dart';

class HomePage extends StatefulWidget {

  final String authId;

  const  HomePage({super.key, required this.authId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();

  String? name;
  String? email;
  String? createdAt;


  @override
  void initState() {
    _initializeData();
  }

  Future<void> signOut() async{
    authService.signOut();
    SharedPrefenceService.prefs?.remove("authId");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const LoginPage()),);

    });
  }

  void _initializeData() async {
    try {
      UserModel? user = await authService.getUser(widget.authId);

      if (user != null) {
        setState(() {
          name = user.name;
          email = user.email;
          createdAt = user.createdAt.substring(0,10);
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
      }
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome !"),),
      body: Align(
        alignment: Alignment.topCenter,
        child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize:  MainAxisSize.min,
                children: [
                  Text(
                    "Ad : $name",
                    style:TextStyles.cardText,),
                  Text(
                    "Email : $email",
                    style:TextStyles.cardText,
                  ),
                  Text("Oluşturma Tarihi : $createdAt",
                      style:TextStyles.cardText,
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CardButton(onPressed: signOut,)


                  )
                ],
              ),
            ),

          ),
      ),



    );
  }
}
