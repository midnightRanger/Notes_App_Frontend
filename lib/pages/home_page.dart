import 'package:dart_interface/dio.dart';
import 'package:dart_interface/domain/models/post.dart';
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
        child: FutureBuilder<List<Post>?>(
            future: _client.getNotes(token: widget.token!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data![index].name!,
                          textAlign: TextAlign.center,
                        ),
                        subtitle: 
                        ConstrainedBox(
                          constraints: new BoxConstraints(
                            minHeight: 50.0
                          ),
                          child: 
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(242, 201, 76, 1),
                              border: Border.all(
                                color: Color.fromRGBO(242, 201, 76, 1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Text(snapshot.data![index].content!)
                            ),
                        ),
                        
                      );
                    });
              }

              return CircularProgressIndicator();
            }));
  }
}
