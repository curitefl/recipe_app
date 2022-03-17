import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/food_stuffs/food_stuffs_page_model.dart';
import 'package:recipe_app/text_data.dart';

class FoodStuffsPage extends StatelessWidget {
  const FoodStuffsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodStuffsPageModel>(
      builder: (context, model, child) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    size: IconTheme.of(context).size,
                  ),
                  hintText: TextData.search,
                  hintStyle: Theme.of(context).textTheme.subtitle1,
                ),
                onSubmitted: (String inputPhrase) {
                  model.searchFoodStuffs(inputPhrase);
                },
          ),
            ),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(model.foodStuffListForView.length, (index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Stack(
                        children: [
                          Image.asset(
                            model.foodStuffListForView[index].foodImagePath,
                            width: 150.0.w,
                            height: 150.0.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Text(
                                  model.foodStuffListForView[index].foodStuffName[TextData.hiragana].toString(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  '${model.foodStuffListForView[index].foodStuffAmount}${TextData.gram}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.all(8.0.w),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: CircleAvatar(
                                          radius: 20.0.r,
                                          backgroundColor: Colors.grey.withOpacity(0.7),
                                          child: IconButton(
                                              onPressed: () => model.decrementAmount(index),
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.blue,
                                              )),
                                        ),
                                      ),
                                      SizedBox(width: 20.0.w),
                                      Expanded(
                                        flex: 1,
                                        child: CircleAvatar(
                                          radius: 20.0.r,
                                          backgroundColor: Colors.grey.withOpacity(0.7),
                                          child: IconButton(
                                              onPressed: () => model.incrementAmount(index),
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.red,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
            ),
          ],
        );
      }
    );
  }
}
