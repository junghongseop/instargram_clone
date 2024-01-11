import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopup extends StatelessWidget {
  final String? title;
  final String? message;
  final Function? okCallback;
  final Function? cancelCallback;

  const MessagePopup({
    Key? key,
    required this.title,
    required this.message,
    required this.okCallback,
    this.cancelCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            width: Get.width * 0.7,
            child: Column(
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                Text(
                  message!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: okCallback as void Function() ?, child: const Text('확인')),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: cancelCallback as void Function() ?,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      child: const Text('취소'),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
