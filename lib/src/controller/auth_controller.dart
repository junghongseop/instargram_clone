import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instargram/src/models/user_model.dart';
import 'package:instargram/src/repository/user_repository.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<UserModel> user = UserModel().obs;

  Future<UserModel?> loginUser(String uid) async {
    // DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }

  void signup(UserModel signupUser, XFile? thumbnail) async {
    if (thumbnail == null) {
      _submitSignup(signupUser);
    } else {
      var task = uploadXFile(thumbnail,
          '${signupUser.uid}/profile.${thumbnail.path.split('.').last}');
      task.snapshotEvents.listen((event) {
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          var downloadURL = event.ref.getDownloadURL();
          var updateUserData = signupUser.copyWith(thumbnail: downloadURL);
          _submitSignup(updateUserData);
        }
      });
    }
  }

  uploadXFile(XFile file, String filename) {
    var f = File(file.path);
    var ref = FirebaseStorage.instance.ref().child('users').child(filename);
    // users/{uid}/profile.jpg or .png 등으로 저장

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    return ref.putFile(f, metadata);
  }

  void _submitSignup(UserModel signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      user(signupUser);
    }
  }
}
