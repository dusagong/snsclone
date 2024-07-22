import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/auth/auth_screen.dart';
import 'package:instagramclone/screen/home.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            // return const HomeScreen() ;
            return AuthPage();

          }else{
            return AuthPage();
          }
        },
      ),
    );
  }
}