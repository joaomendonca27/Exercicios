import 'package:app/pages/home/domain/models/games.dart';
import 'package:flutter/material.dart';
import 'widgets/detail_app_bar_widget.dart';
import 'widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    Key? key,
    required this.games,
    required this.list,
    required this.onBack,
    required this.controller,

  }) : super(key: key);
  final Games games;
  final List<Games> list;
  final VoidCallback onBack;
  final PageController controller;


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scrollController.position.pixels > 37) {
              isOnTop = false;
            } else if (scrollController.position.pixels <= 36) {
              isOnTop = true;
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              games: widget.games,
              onBack: widget.onBack,
              isOnTop: isOnTop,
            ),
            DetailListWidget(
              games: widget.games,
              list: widget.list,
              controller: widget.controller,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
