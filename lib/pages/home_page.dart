import 'package:dart_interface/dio.dart';
import 'package:dart_interface/globals/settings/utils/router_utils.dart';
import 'package:dart_interface/pages/profile_page_edit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../domain/models/user.dart';

class HomePage extends StatelessWidget {
  String token;
  HomePage({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageStateful(token: token),
    );
  }
}

class HomePageStateful extends StatefulWidget {
  final String? token;
  HomePageStateful({super.key, this.token});

  @override
  State<HomePageStateful> createState() => _HomePageStateful(token: token!);
}

class _HomePageStateful extends State<HomePageStateful> {
  String token;

  final List<String> users = ["Tom", "Alice", "Sam", "Bob", "Kate"];

  _HomePageStateful({required this.token});

  final Dio_Client _client = Dio_Client();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: FutureBuilder<User?>(
              future: _client.getProfile(token: widget.token!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  User? userInfo = snapshot.data;
                  if (userInfo != null) {
                    return ListView(
            children: snapshot.data!<Widget>((single) {
          return Text('saddasd');
        }).toList());
                  }
                }
                return CircularProgressIndicator();
              }),
    ));
  }
}
