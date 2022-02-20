import 'package:flutter/material.dart';
import 'package:recipe_app/text_data.dart';

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
      length: tabTexts.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (int i = 0; i < tabTexts.length; ++i) ...{
                Tab(text: tabTexts[i]),
              }
            ],
          ),
        ),
      ),
    );
  }
}
