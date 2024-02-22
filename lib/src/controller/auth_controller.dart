import 'package:get/get.dart';
import 'package:instargram/src/models/user_model.dart';
import 'package:instargram/src/repository/user_repository.dart';

class AuthController extends GetxController  {
  Future<UserModel?> loginUser(String uid) async {
    // DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }
}