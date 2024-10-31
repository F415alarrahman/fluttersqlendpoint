import 'package:flutter/material.dart';
import 'package:flutterendpoint/autoget.dart';
import 'package:flutterendpoint/get_data.dart';
import 'package:flutterendpoint/post_data.dart';
import 'package:flutterendpoint/put_patch_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Autoget(),
    );
  }
}
