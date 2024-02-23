import 'package:get/get.dart';
import 'package:instargram/src/models/user_model.dart';
import 'package:instargram/src/repository/user_repository.dart';

class AuthController extends GetxController  {

  static AuthController get to => Get.find();

  Rx<UserModel> user = UserModel().obs;

  Future<UserModel?> loginUser(String uid) async {
    // DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }

  void signup(UserModel signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      user(signupUser);
    }
  }
}