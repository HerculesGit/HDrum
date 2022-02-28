import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _initDependencies();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        indicatorColor: const Color(0xFFF39428),
        focusColor: const Color(0xFFD36C1F),
      ),
      home: HomeScreen(),
    );
  }

  void _initDependencies() {
    // Get.put(LeftSideBarController(), permanent: true);
  }
}
