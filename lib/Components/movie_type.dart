import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieTypes extends StatelessWidget {
  final String movieType;
  final bool isSelected;
  final VoidCallback onTap;

  const MovieTypes(
      {super.key,
      required this.movieType,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 80,
            color: Colors.grey.shade400,
            child: Center(
                child: Text(
              movieType,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isSelected ? Colors.orange : Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
