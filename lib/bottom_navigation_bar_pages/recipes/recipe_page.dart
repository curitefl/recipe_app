import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/food_stuffs/food_stuffs_page_model.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/recipe_page_model.dart';
import 'package:recipe_app/src/model/youtube_video.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/video_arguments.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<FoodStuffsPageModel, RecipePageModel>(
      create: (context) => RecipePageModel(),
      update: (context, foodStuffsPageModel, recipePageModel) {
        final queryKeyword = foodStuffsPageModel.foodStuffListOriginal
            .map((foodstuff) {
              if (foodstuff.foodStuffAmount != 0) {
                return foodstuff.foodStuffName[TextData.hiragana];
              }
            })
            .whereType<String>()
            .toList()
            .toString();
        recipePageModel!.callAPI(queryKeyword);
        return recipePageModel;
      },
      child: Consumer<RecipePageModel>(builder: (context, model, child) {
        if (model.isLoading && model.videoResult.isEmpty) {
          return Center(
              child: SizedBox(
                  width: 50.0.w, height: 50.0.h, child: const CircularProgressIndicator()));
        } else if (!model.isLoading && model.videoResult.isEmpty) {
          return const Center(child: Text(TextData.notFoundRecipe));
        }
        return ListView(
          children: model.videoResult
              .map(
                (video) => buildInkWell(context, video),
          )
              .toList(),
        );
      }),
    );
  }

  InkWell buildInkWell(BuildContext context, YouTubeVideo video) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/${TextData.videos}',
          arguments: VideoArguments(
            video,
          ),
        );
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7.0.h),
          padding: EdgeInsets.all(12.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.0.w),
                child: Image.network(
                  video.thumbnail.small.url ?? '',
                  width: 120.0.w,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.0.h),
                      child: Text(
                        video.channelTitle,
                        softWrap: true,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Text(
                      video.url,
                      softWrap: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
