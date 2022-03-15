import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/food_stuffs/food_stuffs_page_model.dart';
import 'package:recipe_app/text_data.dart';

class FoodStuffsPage extends StatelessWidget {
  const FoodStuffsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodStuffsPageModel>(builder: (context, model, child) {
      return GridView.count(
        crossAxisCount: 3,
        children: List.generate(model.foodStuffList.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Image.asset(
                  model.foodStuffList[index].foodImagePath,
                  width: 100.0,
                  height: 100.0,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        model.foodStuffList[index].foodStuffName,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '${model.foodStuffList[index].foodStuffAmount}${TextData.gram}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.grey.withOpacity(0.7),
                                child: IconButton(
                                    onPressed: () => model.decrementAmount(index),
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.blue,
                                    )),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                radius: 20.0,
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
      );
    });
  }
}
