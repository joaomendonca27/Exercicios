import 'package:app/app/route.dart';
import 'package:app/pages/home/domain/repositories/games_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Lovers App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Routes(
        repository: GamesRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
