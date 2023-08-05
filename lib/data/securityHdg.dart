import 'package:flutter/material.dart';
import '../models/securityHdgModel.dart';
import '../models/qChaptersModel.dart';
import '../data/qData.dart';

const TopHomeMenu = [
  securityHdg(
    id: 'phishing',
    title: 'Phishing Test',
    color: Colors.orange,
  ),
  securityHdg(
    id: 'level1',
    title: 'Basic Security Tests',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'devops1',
    title: 'DevOps - Level 1',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'devops2',
    title: 'DevOps - Level 2',
    color: Colors.lightBlueAccent,
  ),
  securityHdg(
    id: 'progress',
    title: 'Progress Card',
    color: Colors.yellow,
  ),
  securityHdg(
    id: 'labs',
    title: 'Labs',
    color: Colors.lightGreen,
  ),
  securityHdg(
    id: 'learning',
    title: 'Learning Modules',
    color: Colors.lightGreen,
  ),
];

Map<String, dynamic> levels = {
  "phishing": qChaptersPhishing,
  "level1": qChaptersDataLevel1,
  "devops1": qChaptersDevops1,
  "devops2": qChaptersDevops2,
};

var qChaptersPhishing = [
  qChaptersModel(
      id: "phishing-c1",
      title: "Phishing Tests",
      imageUrl: Image.asset('assets/images/one.jpeg'),
      // 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Simple,
      q: qPhishing),
];

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

var qChaptersDevops1 = [
  qChaptersModel(
      id: "devops1-c1",
      title: "Advanced Security",
      imageUrl: Image.asset('assets/images/five.jpeg'),
      complexity: Complexity.Simple,
      q: qDevops1c1),
  qChaptersModel(
      id: "devops1-c2",
      title: "Advanced IAM",
      imageUrl: Image.asset('assets/images/six.jpeg'),
      //'https://placebear.com/g/200/200',
      complexity: Complexity.Challenging,
      q: qDevops1c1),
];

var qChaptersDevops2 = [
  qChaptersModel(
      id: "devops2-c1",
      title: "Very Advanced Security",
      imageUrl: Image.asset('assets/images/one.jpeg'),
      // 'https://source.unsplash.com/user/c_v_r/1900x800',
      complexity: Complexity.Simple,
      q: qDevops2c1),
];
