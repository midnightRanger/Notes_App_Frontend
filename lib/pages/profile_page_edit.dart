import 'package:dart_interface/pages/widgets/dynamic_auth_widget.dart';
import 'package:flutter/material.dart';

import '../dio.dart';
import '../domain/models/user.dart';
import 'client_validators/auth_validator.dart';

class ProfilePageEdit extends StatelessWidget {
  String token;
  ProfilePageEdit({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Auth')),
      body: ProfilePageEditStateful(token: token),
    );
  }
}

class ProfilePageEditStateful extends StatefulWidget {
  final String? token;
  ProfilePageEditStateful({super.key, this.token});

  @override
  State<ProfilePageEditStateful> createState() =>
      _ProfilePageEditStateful(token: token!);
}

class _ProfilePageEditStateful extends State<ProfilePageEditStateful> {
  

  final AuthValidators authValidator = AuthValidators();
  
  // controllers
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

// create focus nodes
  late FocusNode emailFocusNode;
  late FocusNode usernameFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  String token;
  _ProfilePageEditStateful({required this.token});

  final Dio_Client _client = Dio_Client();


  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    emailFocusNode = FocusNode();
    usernameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    emailFocusNode.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder<User?>(
              future: _client.getProfile(id: '1', token: widget.token!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  User? userInfo = snapshot.data;
                  if (userInfo != null) {
                    return Column(children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(156, 152, 140, 1),
                                border: Border.all(
                                  color: Color.fromRGBO(156, 152, 140, 1),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                              ),
                              child: Expanded(
                                child: Icon(Icons.account_box, size: 100.0),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text("User profile",
                                  style: Theme.of(context).textTheme.headline2))
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, right: 10, left: 10),
                        child: Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 1),
                      ),

                      DynamicInputWidget(
              controller: emailController,
              obscureText: false,
              focusNode: emailFocusNode,
              toggleObscureText: null,
              validator: authValidator.emailValidator,
              prefIcon: const Icon(Icons.mail),
              labelText: "Enter Email Address",
              textInputAction: TextInputAction.next,
              isNonPasswordField: true,
            ),

                      Expanded(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return ProfilePageEdit(
                                              token: widget.token!);
                                        },
                                      ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(3, 158, 162, 1),
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      minimumSize: Size(42, 42),
                                    ),
                                    child: Text("Update profile",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1)),
                              )))
                      // SizedBox(height: 8.0),
                      // Text(
                      //   '${userInfo.userName} ${userInfo.email}',
                      //   style: TextStyle(fontSize: 16.0),
                      // )
                    ]);
                  }
                }
                return CircularProgressIndicator();
              })),
    );
  }
}