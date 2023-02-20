import 'package:dart_interface/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class ProfilePageStateful extends StatefulWidget {
  const ProfilePageStateful({super.key});

  @override
  State<ProfilePageStateful> createState() => _ProfilePageStateful();
}

class _ProfilePageStateful extends State<ProfilePageStateful>  {
  final userProfile = Dio_Client().getProfile(id: "1");  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('),
      ),
      
    );
  }
}

