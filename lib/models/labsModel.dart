import 'package:flutter/material.dart';

class LabsModel {
  final String id;
  final String title;
  final Color color;

  const LabsModel({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
