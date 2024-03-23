
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatButton extends StatelessWidget {
  final String seat;
  final bool isSelected;
  // final Function(String) onPressed;
  final VoidCallback onTap;

  SeatButton({
    required this.seat,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            seat,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
        color: isSelected
            ?(Colors.blue)
            : (Colors.grey),
      ),
    );
  }
}