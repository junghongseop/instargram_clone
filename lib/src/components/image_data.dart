import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  String icon;
  final double? width;

  ImageData(this.icon, {super.key, this.width = 60});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: width! / Get.mediaQuery.devicePixelRatio,
    );
  }
}

class IconsPath {
  static String get homeOff => 'assets/bottom_nav_home_off_icon.jpg';
  static String get homeOn => 'assets/bottom_nav_home_on_icon.jpg';
  static String get searchOff => 'assets/bottom_nav_search_off_icon.jpg';
  static String get searchOn => 'assets/bottom_nav_search_on_icon.jpg';
  static String get uploadIcon => 'assets/bottom_nav_upload_icon.jpg';
  static String get activeOff => 'assets/bottom_nav_active_off_icon.jpg';
  static String get activeOn => 'assets/bottom_nav_active_on_icon.jpg';
  static String get logo => 'assets/logo.jpg';
  static String get directMessage => 'assets/direct_msg_icon.jpg';
  static String get plusIcon => 'assets/plus_icon.png';
  static String get postMoreIcon => 'assets/more_icon.jpg';
  static String get likeOffIcon => 'assets/like_off_icon.jpg';
  static String get likeOnIcon => 'assets/like_on_icon.jpg';
  static String get replyIcon => 'assets/reply_icon.jpg';
  static String get bookMarkOffIcon => 'assets/book_mark_off_icon.jpg';
  static String get bookMarkOnIcon => 'assets/book_mark_on_icon.jpg';
  static String get backBtnIcon => 'assets/back_icon.jpg';
  static String get menuIcon => 'assets/menu_icon.jpg';
  static String get addFriend => 'assets/add_friend_icon.jpg';
  static String get gridViewOff => 'assets/grid_view_off_icon.jpg';
  static String get gridViewOn => 'assets/grid_view_on_icon.jpg';
  static String get myTagImageOff => 'assets/my_tag_image_off_icon.jpg';
  static String get myTagImageOn => 'assets/my_tag_image_on_icon.jpg';
  static String get nextImage => 'assets/upload_next_icon.jpg';
  static String get closeImage => 'assets/close_icon.jpg';
  static String get imageSelectIcon => 'assets/image_select_icon.jpg';
  static String get cameraIcon => 'assets/camera_icon.jpg';
  static String get uploadComplete => 'assets/upload_complete_icon.jpg';
  static String get mypageBottomSheet01 =>
      'assets/mypage_bottom_sheet_01.jpg';
  static String get mypageBottomSheet02 =>
      'assets/mypage_bottom_sheet_02.jpg';
  static String get mypageBottomSheet03 =>
      'assets/mypage_bottom_sheet_03.jpg';
  static String get mypageBottomSheet04 =>
      'assets/mypage_bottom_sheet_04.jpg';
  static String get mypageBottomSheet05 =>
      'assets/mypage_bottom_sheet_05.jpg';
  static String get mypageBottomSheetSetting01 =>
      'assets/mypage_bottom_sheet_setting_01.jpg';
  static String get mypageBottomSheetSetting02 =>
      'assets/mypage_bottom_sheet_setting_02.jpg';
  static String get mypageBottomSheetSetting03 =>
      'assets/mypage_bottom_sheet_setting_03.jpg';
  static String get mypageBottomSheetSetting04 =>
      'assets/mypage_bottom_sheet_setting_04.jpg';
  static String get mypageBottomSheetSetting05 =>
      'assets/mypage_bottom_sheet_setting_05.jpg';
  static String get mypageBottomSheetSetting06 =>
      'assets/mypage_bottom_sheet_setting_06.jpg';
  static String get mypageBottomSheetSetting07 =>
      'assets/mypage_bottom_sheet_setting_07.jpg';
}