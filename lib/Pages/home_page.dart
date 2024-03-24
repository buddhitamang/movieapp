import 'package:flutter/material.dart';
import 'package:movieapp/Components/movie_type.dart';
import 'package:movieapp/Components/movies.dart';
import 'package:movieapp/Models/movies_provider.dart';
import 'package:provider/provider.dart';

import 'movie_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic moviesProvider;

  @override
  void initState() {
    super.initState();
    moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
  }

  void goToMovies(int movieIndex) {
    moviesProvider.currentMovieIndex = movieIndex;

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MovieDetailsPage()));
  }


  //movie types list
  final List movieTypes = [
    ['All', true],
    ['Horror', false],
    ['drama', false],
    ['action', false],
    ['comedy', false],
  ];

  void MovieSelected(int index) {
    setState(() {
      for (int i = 0; i < movieTypes.length; i++) {
        movieTypes[i][1] = false;
      }
      movieTypes[index][1] = true;
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>DemoPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12),
      ),
      // backgroundColor: Colors.black54,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Welcome', style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold,),
                      ),
                      Text('Buddhi Tamang', style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15),)
                    ],
                  ),
                  Container(
                    child: Icon(Icons.favorite_border, size: 30,),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  color: Colors.grey.shade400,
                  child: Column(
                    children: [
                      Text('Which movie are you going ', style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),),
                      Text('to watch today?', style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search Here',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //movie types

              Container(
                  height: 30,
                  // color: Colors.blue,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: movieTypes.length,
                      itemBuilder: (context, index) {
                        return MovieTypes(movieType: movieTypes[index][0],
                            isSelected: movieTypes[index][1],
                            onTap: () {
                              MovieSelected(index);
                            });
                      })
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recommended',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  Icon(Icons.more_horiz_rounded),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child:
                Consumer<MoviesProvider>(builder: (context, value, child) {
                  final movies = value.movies;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index >= movies.length) {
                          return null; // Return null if index is out of bounds
                        }
                        final movie = movies[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => goToMovies(index),
                            child: SizedBox(
                              width: 250, // Adjust width and height as needed
                              height: 180,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(movie.moviePath)),
                            ),
                          ),
                        );
                      });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
