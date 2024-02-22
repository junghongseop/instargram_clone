import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instargram/src/app.dart';
import 'package:instargram/src/controller/auth_controller.dart';
import 'package:instargram/src/models/user_model.dart';
import 'package:instargram/src/pages/login.dart';
import 'package:instargram/src/pages/signup.dart';

class Root extends GetView<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext _, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          // TODO 내부 파이어베이스 유저 정보를 조회
          return FutureBuilder<UserModel?>(
            future: controller.loginUser(user.data!.uid),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return const App();
              } else {
                return const SignupPage();
              }
            },
          );
        } else {
          return const Login();
        }
      },
    );
  }
}
