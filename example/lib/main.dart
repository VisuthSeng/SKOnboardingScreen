import 'package:flutter/material.dart';
import 'model/sk_onboarding_model.dart';
import 'package:example/presentation/sk_onboarding_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _globalKey,
      body: SKOnboardingScreen(
        bgColor: Colors.red[50],
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          print(value);
          // ignore: deprecated_member_use
          _globalKey.currentState.showSnackBar(SnackBar(
            content: Text("Skip clicked"),
          ));
        },
        getStartedClicked: (value) {
          print(value);
          // ignore: deprecated_member_use
          _globalKey.currentState.showSnackBar(SnackBar(
            content: Text("Get Started clicked"),
          ));
        },
      ),
    );
  }

  final pages = [
    SkOnboardingModel(
        title: 'ស្វារគមន៌មកកាន់កម្មវិធីសម័យទំនើប',
        description: 'ផ្តោតសំខាន់ទៅលើការប្រើប្រាស់មាន ភាពងាយស្រួល',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/onboarding1.png'),
    SkOnboardingModel(
        title: 'រកនឹកចំណងជើងចម្រៀងមែនទេ?',
        description:
            'នៅក្នុងនេះពួកយើងបានចងក្រង ជាច្រើនបែបលក្ខណះ ទៅតាមស្ថានភាព ទេសភាព។',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/onboarding2.png'),
    SkOnboardingModel(
        title: 'តោ!សាកល្បងស្តាប់ទាំងអស់គ្នា',
        description: 'កម្មវិធីបានបង្កើតឡើងដោយស្នាដែរកូនខ្មែរ',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/onboarding3.png'),
  ];
}
