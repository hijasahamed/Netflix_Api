import 'dart:convert';

import 'package:netflix_api_app/Model/movie_model.dart';
import 'package:netflix_api_app/Model/series_model.dart';
import 'package:netflix_api_app/Services/api_service.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> getnowplaying() async{
  const url = 'https://api.themoviedb.org/3/movie/now_playing?$apikey'; 
  final response=await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDM1MTcyNzM1MjM3ZmY3ZGUyYTJlMmVhNWJlMjFhNyIsInN1YiI6IjY1ZDQ5YmEzYmJlMWRkMDE3ZDVmOGJmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CGJkNcA7lQOuBZfcyEEUP7zxOZtGROcgzEIpIosd3z4',
      'accept': 'application/json',
    },
  );
  final json =jsonDecode(response.body)['results'] as List;
  final result = json.map((e) => Movie.fromjason(e)).toList();
  return result;
}

Future<List<Series>> gettvdramas()async{
  const url='https://api.themoviedb.org/3/trending/tv/day?$apikey';
  final response=await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
      'accept': 'application/json',
    },
  );
  final json=jsonDecode(response.body) ['results'] as List;
  final result=json.map((e) => Series.fromjason(e)).toList();
  return result;
}

Future<List<Movie>> getupcoming()async{
  const url='https://api.themoviedb.org/3/movie/upcoming?$apikey';
  final response=await http.get(
    Uri.parse(url),
    headers: {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDM1MTcyNzM1MjM3ZmY3ZGUyYTJlMmVhNWJlMjFhNyIsInN1YiI6IjY1ZDQ5YmEzYmJlMWRkMDE3ZDVmOGJmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CGJkNcA7lQOuBZfcyEEUP7zxOZtGROcgzEIpIosd3z4',
    'accept': 'application/json'
  }
  );
  final json=jsonDecode(response.body) ['results'] as List;
  final result=json.map((e) => Movie.fromjason(e)).toList();
  return result;
}

Future<List<Movie>> gettoprated()async{
  const url='https://api.themoviedb.org/3/movie/top_rated?$apikey'; 
  final response=await http.get(
    Uri.parse(url),
    headers: {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDM1MTcyNzM1MjM3ZmY3ZGUyYTJlMmVhNWJlMjFhNyIsInN1YiI6IjY1ZDQ5YmEzYmJlMWRkMDE3ZDVmOGJmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CGJkNcA7lQOuBZfcyEEUP7zxOZtGROcgzEIpIosd3z4',
    'accept': 'application/json'
  },
  );
  final json=jsonDecode(response.body) ['results'] as List;
  final result=json.map((e) => Movie.fromjason(e)).toList();
  return result;
}

Future<List<Series>> getairingtoday()async{
  const url = 'https://api.themoviedb.org/3/tv/airing_today?$apikey';
  final response=await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
      'accept': 'application/json',
    },
  );
  final json=jsonDecode(response.body) ['results'] as List;
  final result=json.map((e) => Series.fromjason(e)).toList();
  return result;
}

