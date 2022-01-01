import 'package:app/pages/home/domain/models/games.dart';
import 'package:flutter/material.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({
    Key? key,
    required this.games,
    required this.onBack,
    required this.isOnTop,
  }) : super(key: key);
  final Games games;
  final VoidCallback onBack;
  final bool isOnTop;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.amber,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.chevron_left),
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: isOnTop ? 0 : 1,
        child: Text(
          games.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
