import 'package:android_pbl/src/components/avatar_widget.dart';
import 'package:android_pbl/src/components/image_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            type:AvatarType.TYPE3,
            nickname: 'user1',
            size: 40,
            thumbPath: '',
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      imageUrl: '',
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon,
                width: 65,
              ),
              const SizedBox(width: 15,),
              ImageData(
                IconsPath.replyIcon,
                width: 60,
              ),
              const SizedBox(width: 15,),
              ImageData(
                IconsPath.directMessage,
                width: 55,
              ),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 50,
          )
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text( // ????????? ???
            '????????? n???',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ExpandableText( // ????????? ??????
              '?????????\n??????\n??????2...\n',
              prefixText: '??????????????? ?????????',
              onPrefixTap: () {
                print('????????? ??????');
              },
              prefixStyle: TextStyle(fontWeight: FontWeight.bold),
              expandText: '?????????',
              collapseText: '??????',
              maxLines: 3,
              expandOnTextTap: true,
              collapseOnTextTap: true,
              linkColor: Colors.grey,),
        ]
      )
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '?????? ?????? ??????',
          style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
      ),
    );
  }

  Widget _dataAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '1d??????',
        style: TextStyle(color: Colors.grey, fontSize: 11),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(), // ???????????? ????????? ??????
          const SizedBox(height: 15),
          _image(), // ????????? ?????????
          const SizedBox(height: 15),
          _infoCount(), // ?????????, ??????, dm
          const SizedBox(height: 5),
          _infoDescription(), // ????????? ??????, ????????? ??????
          const SizedBox(height: 5),
          _replyTextBtn(), // ??????
          _dataAgo(), // ?????? ??????
        ],
      )
    );
  }
}