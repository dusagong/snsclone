import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagramclone/data/firebase_service/firestore.dart';
import 'package:instagramclone/data/firebase_service/storage.dart';
import 'package:instagramclone/util/exception.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> LogOut()async{
    try{
      await _auth.signOut();
    }on FirebaseException catch(e){
      throw exception(e.message.toString());
    }
  }
  Future<void> LogIn({
    required String email,
    required String password,
    
  })async{
    try{
      await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
    }on FirebaseException catch(e){
      throw exception(e.message.toString());
    }
  }
  Future <void> SignUp({
    required String email,
    required String password,
    required String passwordConfirme,
    required String username,
    required String bio,
    required File profile,
  })async {
    String URL;
    try{
      if(email.isNotEmpty && password.isNotEmpty && username.isNotEmpty && bio.isNotEmpty){
        if(password == passwordConfirme){
          await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
          if(profile != File('')){
            URL = await StorageMethod().uploadImageToStorage('Profile',profile);
          }else{
            URL = '';
          }

          await Firebase_Firestore().CreateUser(email: email, username: username, bio: bio, profile: URL ==''?'https://health.chosun.com/site/data/img_dir/2023/07/17/2023071701753_0.jpg':URL);
        }
        else{
          throw exception('password and confirm password should be same');
        }
      }else{
        throw exception('enter all the fields');
      }
    }on FirebaseException catch(e){
      throw exception(e.message.toString());
    }
  }
}