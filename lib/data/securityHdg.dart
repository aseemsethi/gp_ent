import 'package:flutter/material.dart';
import '../models/securityHdgModel.dart';
import '../models/qChaptersModel.dart';

const ModelData = [
  securityHdg(
    id: 'a1',
    title: 'Test - Level 1',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'a2',
    title: 'Test - Level 2',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'a3',
    title: 'Test - Level 3',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'a3',
    title: 'Check Progress',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'a4',
    title: 'Learning Modules',
    color: Colors.lightGreen,
  ),
  securityHdg(
    id: 'a5',
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
  qChaptersModel(
      id: "c4",
      title: "Certificates and Encryption",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Hard),
];
