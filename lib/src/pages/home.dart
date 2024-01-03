import 'package:flutter/material.dart';
import 'package:instargram/src/components/avatar_widget.dart';
import 'package:instargram/src/components/image_data.dart';
import 'package:instargram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          thumbPath:
              'https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/373691152_3618951701670615_3597480945046137994_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=103&_nc_ohc=wEZP4ddZaCwAX-Hb8dF&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfAtOYb3BGm5SllqXSLub8cdqK1E4R7KXUQjIDZHljqC8g&oe=6599145E&_nc_sid=8b3546',
          type: AvatarType.TYPE2,
          size: 70,
        ),
        Positioned(
          right: 3,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Text(
                '+',
                style:
                    TextStyle(color: Colors.white, fontSize: 20, height: 1.15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 15),
        _myStory(),
        const SizedBox(width: 5),
        ...List.generate(
          100,
          (index) => AvatarWidget(
            thumbPath:
                'https://moorepediatricnc.com/wp-content/uploads/2022/08/default_avatar.jpg',
            type: AvatarType.TYPE1,
          ),
        ),
      ]),
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          IconsPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }
}
