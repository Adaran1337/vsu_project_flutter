import 'package:flutter/material.dart';

class EnergyDrinkDto {
  final String description;

  final int favoriteCount;

  final int id;

  final String title;

  final String subTitle;

  final bool isFavorite;

  Image? image;

  EnergyDrinkDto(this.description, this.favoriteCount, this.id, this.title,
      this.subTitle, this.isFavorite, {this.image});

  EnergyDrinkDto.fromJson(Map<String, dynamic> json)
      : description = json['description'] as String,
        favoriteCount = json['favoriteCount'] as int,
        id = json['id'] as int,
        title = json['title'] as String,
        subTitle = json['subTitle'] as String,
        isFavorite = json['isFavorite'] as bool;
}
