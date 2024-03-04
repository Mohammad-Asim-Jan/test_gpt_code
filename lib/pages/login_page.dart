import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_gpt_code/pages/first_page.dart';
import 'package:test_gpt_code/pages/home_screen_page.dart';
import 'package:test_gpt_code/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController emailC , passwordC;


  @override
  void initState() {
    // TODO: implement initState
    emailC = TextEditingController();
    passwordC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  void signIn () async {
    final String email = emailC.text.trim();
    final String password = passwordC.text.trim();

    if ( email == '' || password == '') {
      Fluttertoast.showToast(msg: 'Fill all the fields');
    } else {

      try {
        FirebaseAuth auth = FirebaseAuth.instance ;
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);

        Fluttertoast.showToast(msg: 'Log in processing');
        if ( userCredential.user != null) {
          Fluttertoast.showToast(msg: 'Welcome!');

          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return const FirstPage();
          }));
        }

      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.code);
      }
    }
  }

  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: const Icon(
          Icons.login_sharp,
        ),
        backgroundColor: Colors.red.shade400,
        foregroundColor: Colors.white,
        title: Text(
          'Login Page',
          style: GoogleFonts.acme(
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailC,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.mail_outline, size: 17),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                suffixIconColor: Colors.red.shade400,
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordC,
              obscureText: _obscureText,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off , size: 17,),
                    ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                suffixIconColor: Colors.red.shade400,
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
signIn();
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
