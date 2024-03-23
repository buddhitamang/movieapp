import 'package:flutter/material.dart';


class MovieBookingPage extends StatefulWidget {
  @override
  _MovieBookingPageState createState() => _MovieBookingPageState();
}

class _MovieBookingPageState extends State<MovieBookingPage> {
  List<String> selectedSeats = [];

  void selectSeat(String seat) {
    setState(() {
      if (selectedSeats.contains(seat)) {
        selectedSeats.remove(seat);
      } else {
        selectedSeats.add(seat);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Booking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select your seats:'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SeatButton(
                  seat: 'A1',
                  isSelected: selectedSeats.contains('A1'),
                  onPressed: selectSeat,
                ),
                SeatButton(
                  seat: 'A2',
                  isSelected: selectedSeats.contains('A2'),
                  onPressed: selectSeat,
                ),
                SeatButton(
                  seat: 'A3',
                  isSelected: selectedSeats.contains('A3'),
                  onPressed: selectSeat,
                ),
              ],
            ),
            // Add more rows of seats as needed
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate booking
                print('Selected Seats: $selectedSeats');
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatButton extends StatelessWidget {
  final String seat;
  final bool isSelected;
  final Function(String) onPressed;

  SeatButton({
    required this.seat,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(seat),
      child: Text(
        seat,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: isSelected
            ? MaterialStateProperty.all<Color>(Colors.blue)
            : MaterialStateProperty.all<Color>(Colors.grey),
      ),
    );
  }
}
