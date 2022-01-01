import 'package:app/pages/details/container/detail_container.dart';
import 'package:app/pages/home/container/home_container.dart';
import 'package:app/pages/home/domain/repositories/games_repository.dart';
import 'package:flutter/material.dart';


class Routes extends StatelessWidget {
  const Routes({Key? key, required this.repository}) : super(key: key);
  final GamesRepository repository;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(repository: repository,);
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments),
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }
      },
    );
  }
}
