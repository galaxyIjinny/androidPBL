import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType { TYPE1, TYPE2, TYPE3 } //

class AvatarWidget extends StatelessWidget { // 스토리 목록, 썸네일, 이름
  bool? hasStory; // 있는지 없는지. 봤다면 회색
  String thumbPath;
  String? nickname;
  AvatarType type;
  double? size;

  AvatarWidget({
      Key? key,
      required this.type,
      required this.thumbPath,
      this.hasStory,
      this.nickname,
      this.size = 65,
      }) : super(key: key);

  Widget type1Widget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple,
            Colors.orange,
          ],
        ),
        shape: BoxShape.circle
      ),
      child: type2Widget(),
    );
  }

  Widget type2Widget() {
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(65),
            child: SizedBox(
              width: 65,
              height: 65,
              child: CachedNetworkImage(
                imageUrl: thumbPath,
                fit: BoxFit.cover,
              ),
            )
        )
    );
  }

  Widget type3Widget() {
    return Row(
      children: [
        type1Widget(),
        Text(
          nickname ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.TYPE1: // 상단의 프로필+그라데이션 목록
        return type1Widget();
      case AvatarType.TYPE2: // 본인의 프로필인 경우
        return type2Widget();
      case AvatarType.TYPE3: // 이름 포함
        return type3Widget();
    }
  }
}