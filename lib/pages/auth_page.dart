import 'package:dart_interface/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthPageStateful(),
    );
  }
}

class AuthPageStateful extends StatefulWidget {
  const AuthPageStateful({super.key});

  @override
  State<AuthPageStateful> createState() => _AuthPageStateful();
}

class _AuthPageStateful extends State<AuthPageStateful>  {
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
