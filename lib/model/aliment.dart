import 'package:flutter/material.dart';

class Aliment {
  final String name;
  final LinearGradient background;
  final String subtitle;
  final String image;
  final String bottomImage;
  final double totalCalories;
  final double runTime;
  final double bikeTime;
  final double swimTime;
  final double workoutTime;

  Aliment({ this.name,
    this.background,
    this.subtitle,
    this.image,
    this.bottomImage,
    this.totalCalories,
    this.runTime,
    this.bikeTime,
    this.swimTime,
    this.workoutTime
  });

}