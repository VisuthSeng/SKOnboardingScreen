import 'package:example/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:example/model/sk_onboarding_model.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _globalKey,
      body: SKOnboardingScreen(
        bgColor: Colors.white,
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
        description: 'ផ្តោតសំខាន់ទៅលើការប្រើប្រាស់ នឹង ផ្តល់ភាពងាយស្រួល',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/onboarding1.jpg'),
    SkOnboardingModel(
        title: 'រកនឹកចំណងជើងចម្រៀងមែនទេ?',
        description:
            'នៅក្នុងនេះពួកយើងបានចងក្រង ជាច្រើនបែប ដែលលោកអ្នកអាចជ្រើសតាមចំណង់ចំណូលចិត្ត',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/onboarding2.jpg'),
    SkOnboardingModel(
        title: 'តោះ!រីករាយសណ្តាប់កំសាន្តតន្ត្រីជាមួយខ្ញុំ',
        description: 'កម្មវិធីនេះបានបង្កើតឡើងដោយស្នារដៃកូនខ្មែរ',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/onboarding3.jpg'),
  ];
}
