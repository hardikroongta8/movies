import 'package:flutter/material.dart';
import 'package:movies/services/auth_service.dart';
import 'package:movies/services/movie_service.dart';
import 'package:movies/shared/list.dart';
import 'package:movies/shared/loading.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = true;

  final AuthService _authService = AuthService();
  final _movieService = MovieService();

  List popularMovieList = [];
  List topRatedMovieList = [];
  List nowPlayingMovieList = [];
  List allMoviesList = [];
  List categoryTitle = ['Trending Movies', 'Top Rated Movies', 'Now Playing'];
  List<NetworkImage> popularMoviePosterList = [];
  List<NetworkImage> topRatedMoviePosterList = [];
  List<NetworkImage> nowPlayingMoviePosterList = [];
  List allMoviesPosterList = [];

  void getMovies() async {
    Map popularMovies = await _movieService.getPopularMovies();
    setState(() {
      popularMovieList = popularMovies['popularMovieTitles'];
      popularMoviePosterList = popularMovies['popularMoviePosters'];
    });
    Map topRatedMovies = await _movieService.getTopRatedMovies();
    setState(() {
      topRatedMovieList = topRatedMovies['topRatedMovieTitles'];
      topRatedMoviePosterList = topRatedMovies['topRatedMoviePosters'];
    });
    Map nowPlayingMovies = await _movieService.getNowPlayingMovies();
    setState(() {
      nowPlayingMovieList = nowPlayingMovies['nowPlayingMovieTitles'];
      nowPlayingMoviePosterList = nowPlayingMovies['nowPlayingMoviePosters'];
    });
    setState(() {
      allMoviesList = [popularMovieList, topRatedMovieList, nowPlayingMovieList];
      allMoviesPosterList = [popularMoviePosterList, topRatedMoviePosterList, nowPlayingMoviePosterList];
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context){
    return loading ? const Loading() : Scaffold(
      backgroundColor: Colors.pink[900],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Movies'),
        backgroundColor: Colors.pink[900],
        actions: [
          TextButton(
            onPressed: () async {
              await _authService.logout();
            },
            child: const Icon(Icons.logout, color: Colors.white,)
          )
        ],
      ),
      body: Container(
        color: Colors.black87,
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.pink.shade900,
            child: ListView.builder(
              itemCount: allMoviesList.length,
              itemBuilder: (context, index) => MoviesList(movieList: allMoviesList[index], title: categoryTitle[index], posterList: allMoviesPosterList[index],),
            ),
          ),
        )
      ),
    );
  }
}