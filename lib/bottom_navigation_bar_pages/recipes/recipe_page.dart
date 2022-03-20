import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/youtube_album.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/recipe_page_model.dart';
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
    return Center(
      child: Consumer<RecipePageModel>(
        builder: (context, model, child) {
          return FutureBuilder<Album>(
            future: model.futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children: [
                      Text(snapshot.data!.title),
                      Text(snapshot.data!.description),
                    ]
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }
}
