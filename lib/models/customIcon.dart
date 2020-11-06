import 'package:flutter/material.dart';

class CustomIcon {
  final int id;
  final String title;
  final IconData icon;
  final Color color;
  final Color colorHover;
  final double angle;
  final String heroTag;

  CustomIcon({
    this.id,
    this.angle,
    this.title,
    this.color,
    this.colorHover,
    this.icon,
    this.heroTag,
  });
}
