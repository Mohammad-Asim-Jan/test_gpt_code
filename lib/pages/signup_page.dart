import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_gpt_code/pages/home_screen_page.dart';
import 'package:test_gpt_code/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers Declaration
  late TextEditingController nameC,
      emailC,
      phoneC,
      addressC,
      passwordC,
      cPasswordC;

  @override
  void initState() {
    // TODO: implement initState
    nameC = TextEditingController();
    emailC = TextEditingController();
    phoneC = TextEditingController();
    addressC = TextEditingController();
    passwordC = TextEditingController();
    cPasswordC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    addressC.dispose();
    passwordC.dispose();
    cPasswordC.dispose();
    super.dispose();
  }

  void createAccount() async {
    final String name = nameC.text.trim();
    final String email = emailC.text.trim();
    final String phone = phoneC.text.trim();
    final String address = addressC.text.trim();
    final String password = passwordC.text.trim();
    final String cPassword = cPasswordC.text.trim();

    if (name == '' ||
        email == '' ||
        phone == '' ||
        address == '' ||
        password == '' ||
        cPassword == '') {
      Fluttertoast.showToast(msg: 'Fill all the fields');
    } else if (password != cPassword) {
      Fluttertoast.showToast(msg: 'Passwords don\'t match');
    } else {
      try {
        Fluttertoast.showToast(msg: 'Creating account in progress');
        FirebaseAuth auth = FirebaseAuth.instance;
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password);

        if (userCredential.user != null) {
          Fluttertoast.showToast(msg: 'Account Created Successfully');
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const LoginPage();
          }));
        }
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: const Icon(
          Icons.logout_sharp,
        ),
        backgroundColor: Colors.red.shade400,
        foregroundColor: Colors.white,
        title: Text(
          'Sign Up Page',
          style: GoogleFonts.acme(
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameC,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.person, size: 17),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIconColor: Colors.red.shade400,
                  labelText: 'Username',
                  hintText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLength: 11,
                keyboardType: TextInputType.phone,
                controller: phoneC,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.phone, size: 17),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIconColor: Colors.red.shade400,
                  labelText: 'Phone',
                  hintText: 'Enter your phone',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLength: 50,
                controller: addressC,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.home_rounded, size: 17),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIconColor: Colors.red.shade400,
                  labelText: 'Address',
                  hintText: 'Enter your address',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailC,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.mail_outline, size: 17),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIconColor: Colors.red.shade400,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: passwordC,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.lock, size: 17,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIconColor: Colors.red.shade400,
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: cPasswordC,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.lock, size: 17,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIconColor: Colors.red.shade400,
                  labelText: 'Confirm Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  createAccount();
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.red,
                  backgroundColor: Colors.red.shade50,
                  padding: const EdgeInsets.all(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  })); // Go back to the login page
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
