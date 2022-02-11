import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text_data.dart';

class FavoriteRecipePage extends StatelessWidget {
  final String title;
  static const List<String> tabTexts = [
    TextData.mainDishes,
    TextData.sideDishes,
    TextData.soup,
    TextData.riceDishes,
    TextData.desserts,
  ];

  const FavoriteRecipePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: tabTexts[0]),
              Tab(text: tabTexts[1]),
              Tab(text: tabTexts[2]),
              Tab(text: tabTexts[3]),
              Tab(text: tabTexts[4]),
            ],
          ),
        ),
      ),
    );
  }
}
