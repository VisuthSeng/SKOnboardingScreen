import 'package:flutter/material.dart';

class SkOnboardingModel {
  String title;
  String description;
  Color titleColor;
  Color descripColor;
  String imagePath;
  String header;
  String txtheader;

  SkOnboardingModel(
      {@required this.header,
      @required this.title,
      @required this.description,
      @required this.imagePath,
      @required this.titleColor,
      @required this.descripColor,
      this.txtheader});
}
