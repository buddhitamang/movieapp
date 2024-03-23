import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  final String movieTime;
  final bool isSelected;
  final VoidCallback onTap;
  const Time({super.key, required this.movieTime, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color:isSelected? Colors.blue: Colors.black38,
            borderRadius: BorderRadius.circular(8)
          ),
          height: 50,
          width: 70,

          child: Center(child: Text(movieTime)),
        ),
      ),
    );
  }
}
