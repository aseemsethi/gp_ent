import 'package:flutter/material.dart';
import '../models/securityHdgModel.dart';
import '../models/qChaptersModel.dart';

const ModelData = [
  securityHdg(
    id: 'a1',
    title: 'Knowledge Check',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'a2',
    title: 'Progress & Scores',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'a3',
    title: 'Learning Modules',
    color: Colors.lightGreen,
  ),
  securityHdg(
    id: 'a4',
    title: 'Labs',
    color: Colors.lightGreen,
  ),
];

const qChaptersData = [
  qChaptersModel(
      id: "c1",
      title: "Basic Security",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Simple),
  qChaptersModel(
      id: "c2",
      title: "IAM",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      //'https://placebear.com/g/200/200',
      complexity: Complexity.Challenging),
  qChaptersModel(
      id: "c3",
      title: "Firewall",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Hard),
];
