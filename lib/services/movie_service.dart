import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class MovieService{
  List popularMovieTitles = [];
  List topRatedMovieTitles = [];
  List nowPlayingMovieTitles = [];
  final key = 'cce9ca715fd4b873efd62583225040db';

  List<NetworkImage> popularMoviePosters = [];
  List<NetworkImage> topRatedMoviePosters = [];
  List<NetworkImage> nowPlayingMoviePosters = [];

  Future getPopularMovies() async {
    Response res1 = await get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$key'));
    Map data = jsonDecode(res1.body);
    for(int i = 0; i < 15; i++){
      popularMoviePosters.add(NetworkImage('https://image.tmdb.org/t/p/w500${data['results'][i]['poster_path']}'));
      popularMovieTitles.add(data['results'][i]['title']);
    }
    return {'popularMoviePosters': popularMoviePosters, 'popularMovieTitles': popularMovieTitles};
  }

  Future getTopRatedMovies() async {
    Response res = await get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$key'));
    Map data = jsonDecode(res.body);
    for(int i = 0; i < 15; i++){
      topRatedMoviePosters.add(NetworkImage('https://image.tmdb.org/t/p/w500${data['results'][i]['poster_path']}'));
      topRatedMovieTitles.add(data['results'][i]['title']);
    }
    return {'topRatedMovieTitles': topRatedMovieTitles, 'topRatedMoviePosters': topRatedMoviePosters};
  }

  Future getNowPlayingMovies() async {
    Response res = await get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$key'));
    Map data = jsonDecode(res.body);
    for(int i = 0; i < 15; i++){
      nowPlayingMoviePosters.add(NetworkImage('https://image.tmdb.org/t/p/w500${data['results'][i]['poster_path']}'));
      nowPlayingMovieTitles.add(data['results'][i]['title']);
    }
    return {'nowPlayingMovieTitles': nowPlayingMovieTitles, 'nowPlayingMoviePosters': nowPlayingMoviePosters};
  }
}