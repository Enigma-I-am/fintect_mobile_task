import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactsImage extends HookConsumerWidget {
  const ContactsImage({
    super.key,
    this.size = 36,
    this.borderColor = Colors.white,
    this.imgUrl = 'https://avatars.githubusercontent.com/u/50002439?v=4',
  });
  final double size;
  final Color borderColor;
  final String imgUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: ShapeDecoration(
        // image: DecorationImage(
        //   // image: NetworkImage("https://via.placeholder.com/36x36"),
        //   fit: BoxFit.fill,
        // ),
        shape: OvalBorder(
          side: BorderSide(width: 2, color: borderColor),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child:
            Image.network(imgUrl, height: size, width: size, fit: BoxFit.cover),
      ),
    );
  }
}