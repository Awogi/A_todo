import 'package:flutter/material.dart';
import 'home1.dart';
void main(){
  runApp(MYapp());
}
class MYapp extends StatelessWidget {
  const MYapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Myapp",
      debugShowCheckedModeBanner: false,
      home: home1(),
    );
  }
}