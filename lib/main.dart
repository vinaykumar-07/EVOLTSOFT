import 'package:assignment/firebase_options.dart';
import 'package:assignment/screens/explore.dart';
import 'package:assignment/screens/login.dart';
import 'package:assignment/screens/otp.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ExplorePage(),

      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginScreen(),
        'otp': (context) => const MyOtp(),
      },
    );
  }
}
