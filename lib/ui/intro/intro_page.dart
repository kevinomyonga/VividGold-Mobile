import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  final Color bgColor;
  final Widget image;
  final Widget content;
  final BoxDecoration decoration;

  const IntroPage({Key key, this.image, @required this.content, this.bgColor, this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: Container(
            color: bgColor,
            decoration: decoration,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null ? image : const SizedBox.shrink(),
                content,
              ],
            ),
          )
      ),
    );
  }
}
