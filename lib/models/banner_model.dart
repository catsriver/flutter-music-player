import 'package:flutter/material.dart';

class BannerModel {
  BannerModel({
    required this.bannerId,
    required this.pic,
    required this.typeTitle,
    required this.url,
    required this.titleColor,
  });

  final String? bannerId;
  final String pic;
  final String typeTitle;
  final String url;
  final String titleColor;

  Color get tagColor {
    switch (titleColor) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      default:
        throw '$titleColor 未在 BannerModel 类中进行定义';
    }
  }

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        bannerId: json["bannerId"],
        pic: json["pic"],
        typeTitle: json["typeTitle"],
        url: json["url"],
        titleColor: json["titleColor"],
      );

  Map<String, dynamic> toJson() => {
        "bannerId": bannerId,
        "pic": pic,
        "typeTitle": typeTitle,
        "url": url,
        "titleColor": titleColor,
      };
}
