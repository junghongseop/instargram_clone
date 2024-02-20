import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../api/google_signin_api.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 1.0,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
              minimumSize: const Size(
                double.infinity,
                50,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: logIn,
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: Colors.black,
            ),
            label: const Text(
              'LogIn with Google',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future logIn() async {
    await GoogleSignInApi.login();
  }

}
