import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final String selectedDate;
  final String selectedTime;
  final List<String> selectedSeats;
  final String movieName;

  ConfirmationPage({
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedSeats,
    required this.movieName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected Date: $selectedDate'),
            Text('Selected Time: $selectedTime'),
            Text('Selected Seats: ${selectedSeats.join(', ')}'),
            Text('Movie Name: $movieName'),
            // You can add more widgets or customize the UI as needed
          ],
        ),
      ),
    );
  }
}
