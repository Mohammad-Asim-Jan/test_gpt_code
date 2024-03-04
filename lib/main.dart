import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_gpt_code/pages/first_page.dart';
import 'package:test_gpt_code/pages/home_screen_page.dart';
// import 'package:test_gpt_code/pages/home_screen_page.dart';
import 'package:test_gpt_code/pages/signup_page.dart';

import 'firebase_options.dart';

// import 'login_page.dart';

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
      title: 'BloodDonor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade900),
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null) ? const FirstPage() : const HomeScreenPage(),
    );
  }
}
