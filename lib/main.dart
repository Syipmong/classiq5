import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'screens/homescreen.dart';
import 'screens/message_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/signinscreen.dart';
import 'screens/signupscreen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        late Widget page;
        switch (settings.name) {
          case '/':
            page = const HomeScreen();
            break;
          case '/messages':
            page = const MessagesScreen();
            break;
          case '/profile':
            page = const ProfileScreen();
            break;
          case '/signin':
            page = const SigninScreen();
            break;
          case '/signup':
            page = const SignupScreen();
            break;
        }
        return PageTransition(
          child: page,
          type: PageTransitionType.fade, // Choose the desired transition animation
          settings: settings,
        );
      },
    );
  }
}
