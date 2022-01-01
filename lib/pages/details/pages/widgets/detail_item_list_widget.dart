import 'package:app/pages/home/domain/models/games.dart';
import 'package:flutter/material.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {Key? key, required this.isDiff, required this.games})
      : super(key: key);
  final bool isDiff;
  final Games games;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            tween: Tween<double>(
                end: isDiff ? 100 : 300, begin: isDiff ? 300 : 100),
            builder: (context, value, child) {
              return Container(
                color: Colors.grey,
              );
            }),
      ),
    );
  }
}
