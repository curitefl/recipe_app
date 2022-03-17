import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/my_page_list_tile.dart';
import 'package:recipe_app/text_data.dart';

class RecipePage extends StatelessWidget {
  final List<ListTileDomain> _recipePageListView = [
    ListTileDomain(TextData.recipes, Icons.blender),
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
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: ListTile(
                leading: Icon(_recipePageListView[index].icon),
                title: Text(_recipePageListView[index].text),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pushNamed('/${_recipePageListView[index].text}');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
