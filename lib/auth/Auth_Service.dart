

import 'package:flutterproject/auth/Supabase_Client.dart';
import 'package:flutterproject/models/User_Model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService{

  final SupabaseClient client = SupabaseConfig.client;


   Future<User?> signUp(name,lastName,email,password) async{

    try{
      final AuthResponse res = await client.auth.signUp(
        email: email,
        password: password,
      );

      final Session? session = res.session;
      final User? user = res.user;


      if(user!=null){
        try{
          await client.from('users').insert({
            'name':name,
            'lastName':lastName,
            'email':user.email,
            'authId':user.id});

         }catch(e){
          print('Veritabanına ekleme hatası: $e');
        }

      }

      return user != null ? user : null;

    }catch(e){
      print(e);
    }

    return null;
  }

  Future<User?> signIn(email,password) async{

    print(email);

    try{
      final response = await client.auth.signInWithPassword(
          email: email,
          password: password);

      final User? user = response.user;
      final Session? session = response.session;

      print(user);

      return user != null ? user : null;



    }catch(e){
      print(e);
    }

    return null;


  }

  Future<void> signOut() async{
     try{
       await client.auth.signOut();
       print("Çıkış Yapıldı");
     }catch(e){
       print("Hata $e");
     }
  }


  User? getCurrentUser() {
     final user = client.auth.currentUser;
  }

  Future<UserModel?> getUser(String authId) async{
     print(authId);
     try{
       final response = await client
           .from('users')
           .select('*')
           .eq('authId', authId)
           .limit(1)
           .maybeSingle();

       if(response !=null){
         print("kullanıcı:$response");
         UserModel user =  UserModel.fromJson(response);
         return user;
       }

       return null;

     }catch(e){
      print("hata:$e");
     }

     return null;
  }




}