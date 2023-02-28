import 'package:dart_interface/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/models/user.dart';

class ProfilePage extends StatelessWidget {
 String token;
 ProfilePage({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ProfilePageStateful(token: token),
    );
  }
}

class ProfilePageStateful extends StatefulWidget {
  final String? token; 
  ProfilePageStateful({super.key, this.token});

  @override
  State<ProfilePageStateful> createState() => _ProfilePageStateful(token: token!);
}

class _ProfilePageStateful extends State<ProfilePageStateful>  {
  String token; 
  _ProfilePageStateful({required this.token});
  
  final Dio_Client _client = Dio_Client();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<User?>(
          future: _client.getProfile(id: '1', token: widget.token!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User? userInfo = snapshot.data;
              if (userInfo != null) {
                 return Column(
                  children: [
                     ClipRRect(
                      child: Text("Hello there")
                      ),
                      



                    // SizedBox(height: 8.0),
                    // Text(
                    //   '${userInfo.userName} ${userInfo.email}',
                    //   style: TextStyle(fontSize: 16.0),
                    // )
                  ],
                 );
              }
        
            }
            return CircularProgressIndicator();
          }
        ),
      
    );
  }
}

