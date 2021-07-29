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
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 2),
      builder: (BuildContext context, double _value, Widget child) => Opacity(
        opacity: _value,
        child: Padding(
          padding: EdgeInsets.only(left: _value * 5),
          child: Text(
            titletop1,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
