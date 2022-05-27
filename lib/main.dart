import 'package:flutter/material.dart';
import 'package:formation/recipeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Formation Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RecipeScreen(),
    );
  }
}