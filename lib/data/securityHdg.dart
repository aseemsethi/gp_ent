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

Map<String, dynamic> levels = {
  "level1": qChaptersDataLevel1,
  "level2": qChaptersDataLevel2,
  "level3": qChaptersDataLevel3,
};

var qChaptersDataLevel1 = [
  qChaptersModel(
      id: "level1-c1",
      title: "Basic Security",
      imageUrl: Image.asset('assets/images/one.jpeg'),
      complexity: Complexity.Simple,
      q: qLevel1Basic),
  qChaptersModel(
      id: "level1-c2",
      title: "IAM",
      imageUrl: Image.asset('assets/images/two.jpeg'),
      //'https://placebear.com/g/200/200',
      complexity: Complexity.Challenging,
      q: qLevel1Basic),
  qChaptersModel(
      id: "level1-c3",
      title: "Firewall",
      imageUrl: Image.asset('assets/images/three.jpeg'),
      complexity: Complexity.Hard,
      q: qLevel1Basic),
  qChaptersModel(
      id: "level1-c4",
      title: "Certificates and Encryption",
      imageUrl: Image.asset('assets/images/four.jpeg'),
      complexity: Complexity.Hard,
      q: qLevel1Basic),
];

var qChaptersDataLevel2 = [
  qChaptersModel(
      id: "level2-c1",
      title: "Advanced Security",
      imageUrl: Image.asset('assets/images/five.jpeg'),
      complexity: Complexity.Simple,
      q: qLevel2Basic),
  qChaptersModel(
      id: "level2-c2",
      title: "Advanced IAM",
      imageUrl: Image.asset('assets/images/six.jpeg'),
      //'https://placebear.com/g/200/200',
      complexity: Complexity.Challenging,
      q: qLevel2Basic),
];

var qChaptersDataLevel3 = [
  qChaptersModel(
      id: "level3-c1",
      title: "Very Advanced Security",
      imageUrl: Image.asset('assets/images/one.jpeg'),
      // 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Simple,
      q: qLevel3Basic),
];
