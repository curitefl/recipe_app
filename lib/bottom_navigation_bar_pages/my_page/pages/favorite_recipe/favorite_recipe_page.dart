import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/text_data.dart';

class FavoriteRecipePage extends StatelessWidget {
  final String title;
  static const List<String> _tabTexts = [
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
      length: _tabTexts.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          titleTextStyle: Theme.of(context).textTheme.headline3,
          bottom: TabBar(
            isScrollable: true,
            labelStyle: Theme.of(context).textTheme.headline3,
            tabs: [
              for (int i = 0; i < _tabTexts.length; ++i) ...{
                Tab(text: _tabTexts[i]),
              }
            ],
          ),
        ),
      ),
    );
  }
}
