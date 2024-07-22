import 'package:flutter/material.dart';
import 'package:instagramclone/data/firebase_service/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: ()async{
            await Authentication().LogOut;
          },
          child: Container(
            child: Text('log out',style: TextStyle(color: Colors.black),),),
        ),
      ),
    );
  }
}