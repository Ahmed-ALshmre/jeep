import 'package:flutter/material.dart';
import 'package:jeep/home.dart';

import 'home2/toyota.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'الوسيط لقطع الغيار',
    );
  }
}
