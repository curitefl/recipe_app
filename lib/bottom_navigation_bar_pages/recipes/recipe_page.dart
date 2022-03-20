import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/youtube_album.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/recipe_page_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/my_page_list_tile.dart';
import 'package:recipe_app/text_data.dart';

class RecipePage extends StatelessWidget {
  final List<ListTileDomain> _recipePageListView = [
  ListTileDomain(TextData.videos, Icons.videocam),
  ];
  RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: _recipePageListView.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black38),
              ),
            ),
            child: ListTile(
              leading: Icon(_recipePageListView[index].icon),
              title: Text(_recipePageListView[index].text),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pushNamed('/${_recipePageListView[index].text}');
              },
            ),
          );
        },
      ),
    );
  }
}
