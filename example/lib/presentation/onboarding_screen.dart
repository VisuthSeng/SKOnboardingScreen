library sk_onboarding_screen;

import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:example/presentation/Home_screen.dart';
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
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        widget.skipClicked("Skip Tapped");
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentPage != widget.pages.length - 1
                      ? Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 20, bottom: 10),
                              child: FloatingActionButton(
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: widget.themeColor,
                                ),
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Text(''),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == widget.pages.length - 1
          ? Container(color: Colors.red[100], child: _showGetStartedButton())
          : Text(''),
    );
  }

  Widget _showPageData(SkOnboardingModel page) {
    Tween<double> scaletween = Tween<double>(begin: 1, end: 2);
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 24.0,
      fontFamily: 'Horizon',
      fontWeight: FontWeight.bold,
    );
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Welcome to'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 800,
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'KhmerDevelop',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      speed: Duration(milliseconds: 200),
                    ),
                    ColorizeAnimatedText(
                      'Enjoy Music with US',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      speed: Duration(milliseconds: 200),
                    ),
                    ColorizeAnimatedText(
                      'Volumn up and Feel the Music',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      speed: Duration(milliseconds: 200),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                width: 250,
                height: 200,
                child: TweenAnimationBuilder(
                    tween: scaletween,
                    duration: Duration(seconds: 1),
                    curve: Curves.linear,
                    child: Image(
                      image: AssetImage(page.imagePath),
                      fit: BoxFit.contain,
                    ),
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: child,
                      );
                    }),
              ),
            ),
            Spacer(),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mic_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                      BounceInRight(
                        child: Text(
                          page.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: page.titleColor,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FlipInX(
              child: Container(
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: BounceInUp(
                    child: Text(
                      page.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.orange,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _showGetStartedButton() {
    final GestureDetector loginButtonWithGesture = new GestureDetector(
      onTap: () => Get.to(HomeScreen()),
      child: new Container(
        height: 50,
        decoration: new BoxDecoration(
            color: Colors.red[200],
            borderRadius: new BorderRadius.all(Radius.circular(6.0))),
        child: new Center(
          child: new Text(
            'តោះចូលស្តាប់ជាមួយខ្ញុំ !!!',
            style: new TextStyle(
                color: Colors.black,
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
