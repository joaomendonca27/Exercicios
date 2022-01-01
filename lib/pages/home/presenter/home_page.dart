
import 'package:app/pages/home/domain/models/games.dart';
import 'package:app/pages/home/widgets/games_item_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, })
      : super(key: key);
  final List<Games> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: Text(
              'Game Lovers',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list
              .map(
                (e) => GamesItemWidget(
                  games: e,
                  index: list.indexOf(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
