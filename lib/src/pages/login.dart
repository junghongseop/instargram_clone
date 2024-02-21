import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instargram/src/app.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5.0,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              UserCredential userCredential = await signInWithGoogle();
              // 로그인 성공 후 GetX의 Navigator를 이용하여 App 화면으로 이동
              if (userCredential.user != null) {
                Get.off(() => const App());
              }
            },
            child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
          FaIcon(
          FontAwesomeIcons.google,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Login in Google',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          ],
        ),
      ),
    ),
    ),
    backgroundColor: Colors.white,
    );
  }
}
