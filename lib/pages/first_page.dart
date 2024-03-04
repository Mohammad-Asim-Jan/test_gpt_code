import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_gpt_code/pages/login_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  void logOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Fluttertoast.showToast(msg: 'Sign out processing');
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
      return const LoginPage();
    }));
    Fluttertoast.showToast(msg: 'Signned out');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            logOut();
          }, icon: const Icon(Icons.exit_to_app)),],
        title: const Text('First Screen'),
      ),
    );
  }
}
