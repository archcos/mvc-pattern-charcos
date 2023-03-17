import 'package:assignment2/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "MVC",
    theme: ThemeData(
      primarySwatch: Colors.green
    ),
    home: const HomePage(),
  ));
}