import 'package:example/model/sk_onboarding_model.dart';
import 'package:flutter/material.dart';

class SkOnboardingDataTest {
  static Future<List<SkOnboardingModel>> boardingdata() async {
    // ignore: await_only_futures
    var list = await [
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
    return list;
  }
}
