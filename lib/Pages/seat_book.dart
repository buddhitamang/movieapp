import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Components/custum_button.dart';
import 'package:movieapp/Components/date_time.dart';
import 'package:movieapp/Components/screen_paint.dart';
import 'package:movieapp/Components/time.dart';
import 'package:movieapp/Models/movies_provider.dart';
import 'package:provider/provider.dart';

import '../Components/seat_button.dart';
import 'confirm_page.dart';

class SeatBookPage extends StatefulWidget {
  @override
  State<SeatBookPage> createState() => _SeatBookPageState();
}

class _SeatBookPageState extends State<SeatBookPage> {
  //seat
  List seat = [
    ['a', false],
    ['b', false],
    ['c', false],
    ['d', false],
    ['e', false],
    ['f', false],
    ['g', false],
    ['h', false],
  ];

  // List<String> selectedSeats = [];
  void selectSeat(int index) {
    setState(() {
      seat[index][1] = !seat[index][1];
    });
  }

  //Data and time
  List dateTime = [
    ['jan', '22', false],
    ['jan', '23', false],
    ['jan', '24', false],
    ['jan', '25', false],
    ['jan', '26', false],
    ['jan', '28', false],
    ['jan', '29', false],
  ];

  void selectDateAndTime(int index) {
    setState(() {
      bool isSelected = dateTime[index][2];
      for (int i = 0; i < dateTime.length; i++) {
        dateTime[i][2] = false;
      }
      dateTime[index][2] = !isSelected;
    });
  }

  //Data and time
  List time = [
    ['7.30', false],
    ['2.30', false],
    ['11.30', false],
    ['8.30', false],
    ['2.00', false],
    ['9.00', false],
  ];

  void selectTime(int index) {
    setState(() {
      bool isSelected = time[index][1];
      for (int i = 0; i < time.length; i++) {
        time[i][1] = false;
      }
      time[index][1] = !isSelected;
    });
  }
  //
  Future<void> saveBooking() async {
    FirebaseFirestore _firestore=FirebaseFirestore.instance;
    // Get selected date, time, and seats
    String selectedDate = dateTime.firstWhere((element) => element[2], orElse: () => null);
    String selectedTime = time.firstWhere((element) => element[1], orElse: () => null);
    List selectedSeats = seat.where((element) => element[1]).map((e) => e[0]).toList();

    // Create a reference to the bookings collection
    CollectionReference bookings = _firestore.collection('bookings');

    // Add a new document with the selected data
    await bookings.add({
      'date': selectedDate,
      'time': selectedTime,
      'seats': selectedSeats,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Consumer<MoviesProvider>(
                  builder: (context, value, child) {
                    final movies = value.movies;
                    final currentMovies = movies[value.currentMoviesIndex ?? 0];

                    return Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_sharp),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Column(
                          children: [
                            Text(
                              currentMovies.movieName,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text('Session Selection')
                          ],
                        )
                      ],
                    );
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dateTime.length,
                      itemBuilder: (context, index) {
                        return DataTimeContainer(
                            movieDate: dateTime[index][0],
                            movieTime: dateTime[index][1],
                            isSelected: dateTime[index][2],
                            onTap: () => selectDateAndTime(index));
                      })),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 40,
                // color: Colors.blue,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: time.length,
                    itemBuilder: (context, index) {
                      return Time(
                          movieTime: time[index][0],
                          isSelected: time[index][1],
                          onTap: () => selectTime(index));
                    })),
            SizedBox(
              height: 5,
            ),
            CustomPaint(
              size: Size(350, 300),
              painter: ScreenPaintDemo(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 220,
                child: GridView.builder(
                  itemCount: seat.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SeatButton(
                        seat: seat[index][0],
                        isSelected: seat[index][1],
                        onTap: () => selectSeat(index),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle),
                Text('Available'),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.yellow,
                ),
                Text('Reserved'),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.yellow.shade700,
                ),
                Text('selected'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        content: Text('succesful'),
                        actions: [
                          MaterialButton(onPressed: (){
                            Navigator.pop(context);
                          },child: Text('ok'),)
                        ],
                      );
                    });
                    
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
