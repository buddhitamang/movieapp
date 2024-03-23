import 'package:flutter/material.dart';
import 'package:movieapp/Models/movies_provider.dart';
import 'package:movieapp/Pages/seat_book.dart';
import 'package:provider/provider.dart';

import 'demo_book.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(builder: (context,value,child){
      //get movies
      final movies=value.movies;

      //get current movies index
      final currentMovies=movies[value.currentMoviesIndex ?? 0];

      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                  children: [
                    Container(
                      // color: Colors.blue,
                      height: 340,
                      width: double.infinity,
                      child: Image.asset(currentMovies.moviePath,fit: BoxFit.cover,),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 15,
                                blurRadius: 7,
                                offset: Offset(0,3)
                            )
                          ]
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey
                          ),
                          child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon:Icon(Icons.arrow_back_ios_sharp,color: Colors.white,)),
                        ),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey
                            ),
                            child: Icon(Icons.favorite_border,color: Colors.white))
                      ],),]),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(currentMovies.movieName,style: TextStyle(fontSize: 30),),
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.yellow.shade700,),
                            Text(currentMovies.movieRating)
                          ],
                        ),

                      ],
                    ),
                    Container(
                      height: 80,
                      // color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentMovies.movieDescription),
                          SizedBox(height: 10,),
                          Text(currentMovies.directorName,)
                        ],
                      ),
                    ),
                    Divider(

                    ),

                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SeatBookPage()));
                    }, child: Text('BOok NOw'))
                  ],
                  //Descriptions

                ),
              )

            ],
          ),
        ),
      );
    });
  }
}
