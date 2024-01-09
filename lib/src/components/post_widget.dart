import 'package:flutter/material.dart';
import 'package:instargram/src/components/avatar_widget.dart';
import 'package:instargram/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            thumbPath:
                'https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/373691152_3618951701670615_3597480945046137994_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=103&_nc_ohc=wEZP4ddZaCwAX-Hb8dF&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfAtOYb3BGm5SllqXSLub8cdqK1E4R7KXUQjIDZHljqC8g&oe=6599145E&_nc_sid=8b3546',
            type: AvatarType.TYPE3,
            nickname: 'wid_ghdtjq',
            size: 40,
          ),
          GestureDetector(
            onTap: () {},
            child : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _header(),
          // _image(),
          // _infoCount(),
          // _infoDescription(),
          // _replyTextBtn(),
          // _dateAgo(),
        ],
      ),
    );
  }
}
