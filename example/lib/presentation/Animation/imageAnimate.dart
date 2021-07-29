import 'package:flutter/material.dart';

class ImageAnimate extends StatelessWidget {
  final String image;
  const ImageAnimate({
    Key key,
    @required this.colorizeTextStyle,
    @required this.colorizeColors,
    this.image,
  }) : super(key: key);

  final TextStyle colorizeTextStyle;
  final List<MaterialColor> colorizeColors;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.linear,
      tween: Tween<EdgeInsetsGeometry>(
        begin: EdgeInsets.only(right: 350),
        end: EdgeInsets.only(right: 5),
      ),
      duration: Duration(milliseconds: 1500),
      builder: (BuildContext context, EdgeInsetsGeometry _value, child) =>
          Padding(
        padding: _value,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 2),
              builder: (BuildContext context, double _value, Widget child) =>
                  Opacity(
                opacity: _value,
                child: Padding(
                  padding: EdgeInsets.only(left: _value * 5),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// #Animation Opacity
//  return TweenAnimationBuilder(
//       tween: Tween<double>(begin: 0, end: 1),
//       duration: Duration(seconds: 2),
//       builder: (BuildContext context, double _value, Widget child) => Opacity(
//         opacity: _value,
//         child: Padding(
//           padding: EdgeInsets.only(left: _value * 5),
//           child: Image(
//             image: AssetImage(image),
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
//     );
