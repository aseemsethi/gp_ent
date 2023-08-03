import 'package:flutter/material.dart';
import '../models/securityHdgModel.dart';
import '../models/qChaptersModel.dart';
import '../data/qData.dart';

const TopHomeMenu = [
  securityHdg(
    id: 'level1',
    title: 'Test - Level 1',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'level2',
    title: 'Test - Level 2',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'level3',
    title: 'Test - Level 3',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'progress',
    title: 'Check Progress',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'learning',
    title: 'Learning Modules',
    color: Colors.lightGreen,
  ),
  securityHdg(
    id: 'labs',
    title: 'Labs',
    color: Colors.lightGreen,
  ),
];

const Map<String, dynamic> levels = {
  "level1": qChaptersDataLevel1,
  "level2": qChaptersDataLevel2,
  "level3": qChaptersDataLevel2,
};

const qChaptersDataLevel1 = [
  qChaptersModel(
      id: "c1",
      title: "Basic Security",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Simple,
      q: qLevel1Basic),
  qChaptersModel(
      id: "c2",
      title: "IAM",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      //'https://placebear.com/g/200/200',
      complexity: Complexity.Challenging,
      q: qLevel1Basic),
  qChaptersModel(
      id: "c3",
      title: "Firewall",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Hard,
      q: qLevel1Basic),
  qChaptersModel(
      id: "c4",
      title: "Certificates and Encryption",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Hard,
      q: qLevel1Basic),
];

const qChaptersDataLevel2 = [
  qChaptersModel(
      id: "c1",
      title: "Advanced Security",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Simple,
      q: qLevel2Basic),
  qChaptersModel(
      id: "c2",
      title: "Advanced IAM",
      imageUrl: 'https://source.unsplash.com/user/c_v_r/1900x800',
      //'https://placebear.com/g/200/200',
      complexity: Complexity.Challenging,
      q: qLevel2Basic),
];
