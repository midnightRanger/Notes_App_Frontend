import 'package:dart_interface/dio.dart';
import 'package:dart_interface/domain/models/post.dart';
import 'package:dart_interface/globals/settings/utils/router_utils.dart';
import 'package:dart_interface/pages/note_edit_page.dart';
import 'package:dart_interface/pages/profile_page_edit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    itemCount: snapshot.data!.length + 1,
                    itemBuilder: (context, index) {
                      if (index < snapshot.data!.length!) {
                        return ListTile(
                          title: Text(
                            snapshot.data![index].name!,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: ConstrainedBox(
                            constraints: new BoxConstraints(minHeight: 50.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(116, 154, 155, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(3, 158, 162, 1),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                               child: Padding(padding: EdgeInsets.all(10.0), child: 
                                Column(children: [
                                  Row(children: [
                                  
                                    Text(snapshot.data![index].content!, 
                                    style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1),
                                    Expanded(flex: 1, child: SizedBox()),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return ProfilePageEdit(
                                                  token: widget.token!);
                                            },
                                          ));
                                          // GoRouter.of(context).goNamed(APP_PAGE.profile_edit.routeName, queryParams: {'token': widget.token!});
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(10, 86, 88, 1),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          minimumSize: Size(30, 30),
                                        ),
                                        child: const Icon(Icons.delete))
                                  ]),
                                  SizedBox(height: 10.0),
                                   Container(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              onPressed: () {

                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) {
                                                    return NoteEditPage(
                                                        token: widget.token!, id: snapshot.data![index].id!);
                                                  },
                                                ));
                                                // GoRouter.of(context).goNamed(APP_PAGE.profile_edit.routeName, queryParams: {'token': widget.token!});
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Color.fromRGBO(
                                                    10, 86, 88, 1),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10.0),
                                                ),
                                                minimumSize: Size(42, 42),
                                              ),
                                              child: Text("Update",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1))),
                                                      Row(children: [
                                              Text("Created: ${snapshot.data![index].creationDate.toLocal().toString()}", style: TextStyle(fontSize: 12.0, color: Colors.black45),
                                              ),
                                              Expanded(flex: 1, child: SizedBox()),
                                              Text("Updated: ${snapshot.data![index].lastUpdating.toLocal().toString()}", style: TextStyle(fontSize: 12.0, color: Colors.black45),
                                              ),
                       ]) ]))),
                          ),
                        );
                      } else {
                        return Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0), child:
                        Container(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return ProfilePageEdit(
                                          token: widget.token!);
                                    },
                                  ));
                                  // GoRouter.of(context).goNamed(APP_PAGE.profile_edit.routeName, queryParams: {'token': widget.token!});
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(10, 86, 88, 1),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  minimumSize: Size(42, 42),
                                ),
                                child: Text("Create new",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.white)))));
                      }
                    });
              }

              return CircularProgressIndicator();
            }));
  }
}
