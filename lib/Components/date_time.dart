import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTimeContainer extends StatelessWidget {
  final String movieDate;
  final String movieTime;
  final bool isSelected;
  final VoidCallback onTap;

  const DataTimeContainer(
      {super.key,
      required this.movieDate,
      required this.movieTime,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.blue : Colors.black45,
          ),
          width: 60,
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(movieDate), Text(movieTime)],
          ),
        ),
      ),
    );
  }
}
