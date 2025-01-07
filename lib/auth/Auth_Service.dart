
import 'package:flutterproject/auth/Supabase_Client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService{

  final SupabaseClient client = SupabaseConfig.client;


   Future<void> signUp(name,lastName,email,password) async{

    try{
      final AuthResponse res = await client.auth.signUp(
        email: email,
        password: password,
      );

      await client.from('users').insert({'name':name,'lastName':lastName,'email':email});
      
      final Session? session = res.session;
      final User? user = res.user;

    }catch(e){
      print(e);
    }

  }


}