import 'package:app/pages/details/pages/detail_page.dart';
import 'package:app/pages/home/domain/error/failure.dart';
import 'package:app/pages/home/domain/models/games.dart';
import 'package:app/pages/home/domain/repositories/games_repository.dart';
import 'package:app/pages/home/domain/widgets/po_error.dart';
import 'package:app/pages/home/domain/widgets/po_loading.dart';
import 'package:flutter/material.dart';


class DetailArguments {
  DetailArguments({this.index = 0, required this.games});
  final Games games;
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer(
      {Key? key,
      required this.repository,
      required this.arguments,
      required this.onBack})
      : super(key: key);
  final IGamesRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  _DetailContainerState createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<Games>> _future;
  Games? _games;
  @override
  void initState() {
    _controller = PageController(
        viewportFraction: 0.5, initialPage: widget.arguments.index!);
    _future = widget.repository.getAllGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Games>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          if (_games == null) {
            _games = widget.arguments.games;
          }
          return DetailPage(
            games: _games!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
          );
        }

        if (snapshot.hasError) {
          return PoError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
