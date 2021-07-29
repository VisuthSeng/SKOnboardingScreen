import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TitleAnimate extends StatelessWidget {
  final String titletop1;

  const TitleAnimate({
    Key key,
    @required this.colorizeTextStyle,
    @required this.colorizeColors,
    this.titletop1,
  }) : super(key: key);

  final TextStyle colorizeTextStyle;
  final List<MaterialColor> colorizeColors;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.linear,
      tween: Tween<EdgeInsetsGeometry>(
        begin: EdgeInsets.only(left: 150),
        end: EdgeInsets.only(left: 30),
      ),
      duration: Duration(milliseconds: 1500),
      builder: (BuildContext context, EdgeInsetsGeometry _value, child) =>
          Padding(
        padding: _value,
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              titletop1,
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
              speed: Duration(milliseconds: 200),
            ),
          ],
          isRepeatingAnimation: true,
          onTap: () {},
        ),
      ),
    );
  }
}
