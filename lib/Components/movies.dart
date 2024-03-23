import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Movies extends StatelessWidget {
  final String imgPath;
  const Movies({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        // color: Colors.blue,
        // width: 280,
        child: Image.asset(imgPath),
      ),
    );
  }
}
