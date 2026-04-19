import 'package:flutter/material.dart';

enum PkgCardsDispType {
  single(
    16,
    106,
    25,
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  ),
  multi(
    8,
    84,
    20,
    TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );
  // golden(kGolden, AssetsData.oraDiamond, Color(0xFFFF9441), '30', '90');

  final double padding, imgSize, icoSize;
  final TextStyle titleStyle, detsStyle, dtStyle;

  const PkgCardsDispType(
    this.padding,
    this.imgSize,
    this.icoSize,
    this.titleStyle,
    this.detsStyle,
    this.dtStyle,
  );
}
