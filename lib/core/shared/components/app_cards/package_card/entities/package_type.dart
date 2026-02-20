import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

enum PackageType {
  fund(kFund, AssetsData.grDiamond, Color(0xFF21C59F), '10', '30', '24'),
  special(kSpecial, AssetsData.blDiamond, Color(0xFF0069C8), '20', '60', '25'),
  golden(kGolden, AssetsData.oraDiamond, Color(0xFFFF9441), '30', '90', '26');

  final String name, img, price, frame, id;
  final Color color;

  const PackageType(
    this.name,
    this.img,
    this.color,
    this.price,
    this.frame,
    this.id,
  );
}
