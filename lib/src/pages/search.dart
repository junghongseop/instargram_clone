import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      var grid = groupIndex.indexOf(min<int>(groupIndex)!);
      ;
      var size = 1;
      if (grid != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[grid].add(size);
      groupIndex[grid] += size;
    }
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                Text(
                  '검색',
                  style: TextStyle(fontSize: 14, color: Color(0xff838383)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jndex],
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/373691152_3618951701670615_3597480945046137994_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=103&_nc_ohc=mkMZDE2j7S4AX-eiKj4&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfAmpFUf-EFe8mK9bs6MKjmiqkgUFGMb0zmKNK_NG4S-GA&oe=65A4F1DE&_nc_sid=8b3546',
                    fit: BoxFit.cover,
                  ),
                ),
              ).toList(),
            ),
          ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
            Expanded(
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }
}
