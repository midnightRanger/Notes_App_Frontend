import 'package:dart_interface/dio.dart';
import 'package:dart_interface/modelresponse.dart';
import 'package:dart_interface/pages/widgets/dynamic_auth_widget.dart';
import 'package:flutter/material.dart';

import '../user.dart';
import 'client_validators/auth_validator.dart';

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({Key? key}) : super(key: key);

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  Dio_Client _dio = Dio_Client();
  bool? successAuth;
  String? authMessage;

  void authWidget() async {
    User? user = User(
        password: passwordController.text,
        email: null,
        accessToken: null,
        isActive: null,
        hashPassword: null,
        id: null,
        refreshToken: null,
        salt: null,
        userName: emailController.text);
    ModelResponse? modelResponse = await _dio.authUser(user: user);
    print(modelResponse);

    setState(() {
      if (modelResponse != null) {
        //User? userFromJson = User.fromJson(modelResponse.data);
  
        // print(userFromJson.userName);
      } else {
        // print(modelResponse.message);
      }

      // authMessage = modelResponse.message;
    });
  }

  // Define Form key
  final _formKey = GlobalKey<FormState>();

  // Instantiate validator
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

  // to obscure text default value is false
  bool obscureText = true;
  // This will require to toggle between register and sigin in mode
  bool registerAuthMode = false;

// Instantiate all the *text editing controllers* and focus nodes on *initState* function
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

// These all needs to be disposed of once done so let's do that as well.
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

// Create a function that'll toggle the password's visibility on the relevant icon tap.
  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

// Let's create a snack bar to pop info on various circumstances.
// Create a scaffold messanger
  SnackBar msgPopUp(msg) {
    return SnackBar(
        content: Text(
      msg,
      textAlign: TextAlign.center,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Email
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
            const SizedBox(
              height: 20,
            ),
            // Username
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: registerAuthMode ? 65 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: registerAuthMode ? 1 : 0,
                child: DynamicInputWidget(
                  controller: usernameController,
                  obscureText: false,
                  focusNode: usernameFocusNode,
                  toggleObscureText: null,
                  validator: null,
                  prefIcon: const Icon(Icons.person),
                  labelText: "Enter Username(Optional)",
                  textInputAction: TextInputAction.next,
                  isNonPasswordField: true,
                ),
              ),
            ),

            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: registerAuthMode ? 1 : 0,
              child: const SizedBox(
                height: 20,
              ),
            ),

            DynamicInputWidget(
              controller: passwordController,
              labelText: "Enter Password",
              obscureText: obscureText,
              focusNode: passwordFocusNode,
              toggleObscureText: toggleObscureText,
              validator: authValidator.passwordVlidator,
              prefIcon: const Icon(Icons.password),
              textInputAction: registerAuthMode
                  ? TextInputAction.next
                  : TextInputAction.done,
              isNonPasswordField: false,
            ),

            const SizedBox(
              height: 20,
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: registerAuthMode ? 65 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: registerAuthMode ? 1 : 0,
                child: DynamicInputWidget(
                  controller: confirmPasswordController,
                  focusNode: confirmPasswordFocusNode,
                  isNonPasswordField: false,
                  labelText: "Confirm Password",
                  obscureText: obscureText,
                  prefIcon: const Icon(Icons.password),
                  textInputAction: TextInputAction.done,
                  toggleObscureText: toggleObscureText,
                  validator: (val) => authValidator.confirmPasswordValidator(
                      val, passwordController.text),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!registerAuthMode) {
                      authWidget();
                    }
                  },
                  child: Text(registerAuthMode ? 'Register' : 'Sign In'),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(8.0),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(registerAuthMode
                    ? "Already Have an account?"
                    : "Don't have an account yet?"),
                TextButton(
                  onPressed: () {
                    setState(() => registerAuthMode = !registerAuthMode);
                  },
                  child: Text(registerAuthMode ? "Sign In" : "Regsiter"),
                )
              ],
            ),
            Text(authMessage ?? " ")
          ],
        ),
      ),
    );
  }
}
