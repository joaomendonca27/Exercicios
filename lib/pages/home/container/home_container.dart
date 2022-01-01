import 'package:app/pages/home/domain/error/failure.dart';
import 'package:app/pages/home/domain/models/games.dart';
import 'package:app/pages/home/domain/repositories/games_repository.dart';
import 'package:app/pages/home/presenter/home_error.dart';
import 'package:app/pages/home/presenter/home_loading.dart';
import 'package:app/pages/home/presenter/home_page.dart';
import 'package:flutter/material.dart';


class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,

  }) : super(key: key);
  final IGamesRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Games>>(
      future: repository.getAllGames(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data!,

          );
        }

        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
