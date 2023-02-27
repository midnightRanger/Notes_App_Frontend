import 'package:dart_interface/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/models/user.dart';

class ProfilePage extends StatelessWidget {
const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePageStateful(),
    );
  }
}

class ProfilePageStateful extends StatefulWidget {
  const ProfilePageStateful({super.key});

  @override
  State<ProfilePageStateful> createState() => _ProfilePageStateful();
}

class _ProfilePageStateful extends State<ProfilePageStateful>  {
  final Dio_Client _client = Dio_Client();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: FutureBuilder<User?>(
          future: _client.getProfile(id: '1'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User? userInfo = snapshot.data;
              if (userInfo != null) {
                 return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      '${userInfo.userName} ${userInfo.email}',
                      style: TextStyle(fontSize: 16.0),
                    )
                  ],
                 );
              }
        
            }
            return CircularProgressIndicator();
          }
        ),
      ),
      
    );
  }
}

