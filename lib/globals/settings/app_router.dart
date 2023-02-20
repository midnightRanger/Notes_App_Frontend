import 'package:dart_interface/globals/settings/utils/router_utils.dart';
import 'package:dart_interface/pages/home_page.dart';
import 'package:dart_interface/pages/profile_page.dart';
import 'package:dart_interface/pages/screens/auth_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/app_state_provider.dart';
//Custom files


class AppRouter {
  AppRouter({
    required this.appStateProvider,
    required this.prefs,
  });

  AppStateProvider appStateProvider;
  late SharedPreferences prefs;
  get router => _router;


  late final _router = GoRouter(
      refreshListenable: appStateProvider,
      initialLocation: "/",
      routes: [
         GoRoute(
            path: APP_PAGE.auth.routePath,
            name: APP_PAGE.auth.routeName,
            builder: (context, state) => const AuthScreen()
          ),
        // Add the onboard Screen
        GoRoute(
          path: APP_PAGE.home.routePath,
          name: APP_PAGE.home.routeName,
          builder: (context, state) => const HomePage(),
        ),
       

        GoRoute(
            path: APP_PAGE.profile.routePath,
            name: APP_PAGE.profile.routeName,
            builder: (context, state) => const ProfilePage()),
      ],
      redirect: (state) {
        // define the named path of onboard screen
        final String onboardPath =
            state.namedLocation(APP_PAGE.onboard.routeName);

        // Checking if current path is onboarding or not
        bool isOnboarding = state.subloc == onboardPath;

        if (state.subloc == "/") {
          return null; 
        }

        // check if sharedPref as onBoardCount key or not
        //if is does then we won't onboard else we will
        bool toOnboard = prefs.containsKey('onBoardCount') ? false : true;

        if (toOnboard) {
          // return null if the current location is already OnboardScreen to prevent looping
          return isOnboarding ? null : onboardPath;
        }
        // returning null will tell router to don't mind redirect section
        return null;
      });
}