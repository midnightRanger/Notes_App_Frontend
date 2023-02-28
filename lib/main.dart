import 'package:dart_interface/pages/home_page.dart';
import 'package:dart_interface/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals/provider/app_state_provider.dart';
import 'globals/settings/app_router.dart';

Future<void> main() async {
//  concrete binding for applications based on the Widgets framewor
  WidgetsFlutterBinding.ensureInitialized();
// Instantiate shared pref
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.black38),
  // );
  
// Pass prefs as value in MyApp
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatefulWidget {
// Declared fields prefs which we will pass to the router class
  SharedPreferences prefs;
  MyApp({required this.prefs, Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppStateProvider()),
        // Remove previous Provider call and create new proxyprovider that depends on AppStateProvider
        ProxyProvider<AppStateProvider, AppRouter>(
            update: (context, appStateProvider, _) => AppRouter(
                appStateProvider: appStateProvider, prefs: widget.prefs))
      ],
      child: Builder(
        builder: ((context) {
          final GoRouter router = Provider.of<AppRouter>(context).router;

          return MaterialApp.router(
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              );
        }),
      ),
    );
  }
}