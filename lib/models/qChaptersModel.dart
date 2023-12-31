import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

class qChaptersModel {
  final String id;
  final String title;
  final Image imageUrl;
  final Complexity complexity;
  final dynamic q;

  const qChaptersModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.complexity,
    required this.q,
  });
}
