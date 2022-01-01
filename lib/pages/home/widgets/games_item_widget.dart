import 'package:app/pages/home/domain/models/games.dart';
import 'package:flutter/material.dart';


class GamesItemWidget extends StatelessWidget {
  const GamesItemWidget({
    Key? key,
    required this.games,
    required this.index,
  }) : super(key: key);

  final Games games;

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          games.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Text(
                        '#${games.id}',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  //Row(
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  //  children: [
                  //    Column(
                  //      crossAxisAlignment: CrossAxisAlignment.start,
                  //      children: pokemon.url
                  //          .map((e) => TypeWidget(
                  //                name: e,
                  //              ))
                  //          .toList(),
                  //    ),
                  //    Flexible(
                  //        child: Container(
                  //      height: 100,
                  //      width: 100,
                  //    )),
                  //  ],
                  //)
                ],
              ),
            ),
          ),
         //Positioned(
         //  bottom: 12,
         //  right: 2,
         //  child: Image.network(
         //    pokemon.image,
         //    height: 120,
         //  ),
         //),
        ],
      ),
    );
  }
}
