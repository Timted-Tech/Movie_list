import 'package:flutter/material.dart';
import 'package:movie_list/movies_details.dart';

import 'model/movie.dart';

class MovieList extends StatelessWidget {
  MovieList({Key? key}) : super(key: key);
  final List movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: const Text('Movies'),
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 30,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                movieCard(movieList[index], context),
                Positioned(
                  top: 10,
                  child: movieImage(
                    movieList[index].poster,
                  ),
                ),
              ],
            );
            // return Card(
            //   color: Colors.white,
            //   elevation: 20,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: NetworkImage(movieList[index].poster),
            //             fit: BoxFit.cover,
            //           ),
            //           borderRadius: BorderRadius.circular(13.9),
            //         ),
            //       ),
            //     ),
            //     title: Text(
            //       movieList[index].title,
            //       style: const TextStyle(
            //         fontSize: 20,
            //       ),
            //     ),
            //     subtitle: Text(movieList[index].title),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => MovieDetails(
            //             movieName: movieList[index].title,
            //             movie: movieList[index],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8,
              left: 54,
            ),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Text(
                        'Rating: ${movie.imdbRating}/10',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Relased: ${movie.released}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        movie.runtime,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        movie.rated,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetails(
              movieName: movie.title,
              movie: movie,
            ),
          ),
        );
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}
