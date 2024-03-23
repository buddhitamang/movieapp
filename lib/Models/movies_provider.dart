import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:movieapp/Models/movies.dart';

class MoviesProvider extends ChangeNotifier {
  final List<Movies> _movies = [
    Movies(
      directorName:'k xa bau',
        movieName: 'strong girl',
        moviePath: 'lib/images/img1.jpg',
        movieDescription:
            'hello this is the change to get rid of all yuou r sins',
        movieRating: '4.2',
    ),
    Movies(
        movieName: 'Assasin Creed',
        moviePath: 'lib/images/img2.jpg',
        movieDescription:
            'hello this is the change to get rid of all yuou r sins',
        movieRating: '4.9', directorName: 'wang choo'),
    Movies(
        movieName: 'Gangster boys',
        moviePath: 'lib/images/img3.jpg',
        movieDescription:
            'hello this is the change to get rid of all yuou r sins',
        movieRating: '4.0', directorName: 'shakti bot'),

  ];

  int? _currentMoviesIndex=0;

  //getter
 List<Movies> get movies=>_movies;
 int? get currentMoviesIndex=>_currentMoviesIndex;


 //setter
  set currentMovieIndex(int index) {
    _currentMoviesIndex = index;
    notifyListeners(); // Notify listeners about the change
  }





}
