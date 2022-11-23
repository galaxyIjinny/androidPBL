import 'package:android_pbl/src/components/image_data.dart';
import 'package:android_pbl/src/components/post_widget.dart';
import 'package:flutter/material.dart';

import '../components/avatar_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() { // 본인인 경우의 표시
    return Stack(
      children: [
        AvatarWidget(
            type: AvatarType.TYPE2,
            thumbPath: '',
            size: 70,),
        Positioned(
          right: 5,
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
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),
              )
            )
          ),
        )
      ]
    );
  }

  Widget _storyBoardList() { //사용자
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 20),
        _myStory(),
        const SizedBox(width: 5),
        ... List.generate(100,
                (index) => AvatarWidget( // 유저 정보
          type: AvatarType.TYPE1,
          thumbPath: '',
        )
        ),
      ]),
    );
  }

  Widget _postList() { // 포스팅 목록
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(IconsPath.logo, width: 270),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            )
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList()
        ]
      ),
    );
  }
}