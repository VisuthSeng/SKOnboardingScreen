library sk_onboarding_screen;

import 'package:animate_do/animate_do.dart';
import 'package:example/presentation/Animation/imageAnimate.dart';
import 'package:example/presentation/Home_screen.dart';
import 'package:example/presentation/Animation/textAnimate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:example/model/sk_onboarding_model.dart';
import 'package:get/get.dart';

class SKOnboardingScreen extends StatefulWidget {
  final List<SkOnboardingModel> pages;
  final Color bgColor;
  final Color themeColor;
  final ValueChanged<String> skipClicked;
  final ValueChanged<String> getStartedClicked;

  SKOnboardingScreen({
    Key key,
    @required this.pages,
    @required this.bgColor,
    @required this.themeColor,
    @required this.skipClicked,
    @required this.getStartedClicked,
  }) : super(key: key);

  @override
  SKOnboardingScreenState createState() => SKOnboardingScreenState();
}

class SKOnboardingScreenState extends State<SKOnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> buildOnboardingPages() {
    final children = <Widget>[];

    for (int i = 0; i < widget.pages.length; i++) {
      children.add(_showPageData(widget.pages[i]));
    }
    return children;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 8.0,
      width: isActive ? 30.0 : 20.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.deepPurple[700] : Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      // Container(
                      //   alignment: Alignment.centerRight,
                      //   // ignore: deprecated_member_use
                      //   child: FlatButton(
                      //     onPressed: () {
                      //       widget.skipClicked("Skip Tapped");
                      //     },
                      //     child: Text(
                      //       'Skip',
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w500,
                      //         color: Colors.black,
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: 800,
                        color: Colors.transparent,
                        child: PageView(
                            physics: ClampingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            children: buildOnboardingPages()),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                      _currentPage != widget.pages.length - 1
                          ? Expanded(
                              child: Align(
                                alignment: FractionalOffset.bottomRight,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 40, bottom: 60),
                                  // child: FloatingActionButton(
                                  //   backgroundColor: Colors.grey[300],
                                  //   child: Icon(
                                  //     Icons.arrow_forward,
                                  //     size: 30,
                                  //     color: Colors.deepPurple[700],
                                  //   ),
                                  //   onPressed: () {
                                  //     _pageController.nextPage(
                                  //       duration: Duration(milliseconds: 600),
                                  //       curve: Curves.linear,
                                  //     );
                                  //   },
                                  // ),
                                ),
                              ),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: _currentPage == widget.pages.length - 1
          ? _showGetStartedButton()
          : Text(''),
    );
  }

  Widget _showPageData(SkOnboardingModel page) {
    // ignore: unused_local_variable
    Tween<double> scaletween = Tween<double>(begin: 0, end: 5);
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 28.0,
      fontFamily: 'Horizon',
      fontWeight: FontWeight.w700,
    );
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 1550,
              height: 1300,
              child: ImageAnimate(
                colorizeTextStyle: colorizeTextStyle,
                colorizeColors: colorizeColors,
                image: page.imagePath,
              ),
            ),
            right: -550,
            top: -330,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: TitleAnimate(
                  colorizeColors: colorizeColors,
                  colorizeTextStyle: colorizeTextStyle,
                  titletop1: page.txtheader,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: TitleAnimate(
                  colorizeColors: colorizeColors,
                  colorizeTextStyle: colorizeTextStyle,
                  titletop1: page.header,
                ),
              ),
              SizedBox(
                height: 450,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Row(
                      children: [
                        BounceInLeft(
                          child: Icon(
                            Icons.mic_rounded,
                            size: 30,
                            color: Colors.lightBlue,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        BounceInRight(
                          child: Text(
                            page.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: page.titleColor,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(milliseconds: 1500),
                builder: (BuildContext context, double _value, Widget child) =>
                    Opacity(
                  opacity: _value,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 50,
                      right: 20,
                    ),
                    child: FlipInX(
                      child: Container(
                        height: 150,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: BounceInUp(
                            child: Text(
                              page.description,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _showGetStartedButton() {
    final GestureDetector loginButtonWithGesture = new GestureDetector(
      onTap: () => Get.to(HomeScreen()),
      child: new Container(
        height: 60,
        decoration: new BoxDecoration(
          color: Colors.deepPurple[400],
          borderRadius: new BorderRadius.circular(30),
        ),
        child: new Center(
          child: new Text(
            'តោះស្តាប់កំសាន្តជាមួយខ្ញុំ',
            style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    return new Padding(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 30.0),
        child: loginButtonWithGesture);
  }

  // ignore: unused_element
  void _getStartedTapped() {
    widget.getStartedClicked("Get Started Tapped");
  }
}

///
/// Author: Damodar Lohani
/// profile: https://github.com/lohanidamodar
///

/// Clip widget in oval shape at right side
class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class OvalTopBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 40);
    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 0);
    path.quadraticBezierTo(size.width - size.width / 4, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
