import 'package:flutter/cupertino.dart';
import 'package:recipe_app/food_stuff.dart';
import 'package:recipe_app/text_data.dart';

class FoodStuffsPageModel extends ChangeNotifier {
  final List<FoodStuff> _foodStuffList = [
    FoodStuff(TextData.onion, 0, 'images/onion.png'),
    FoodStuff(TextData.carrot, 0, 'images/carrot.png'),
    FoodStuff(TextData.burdock, 0, 'images/burdock.png'),
    FoodStuff(TextData.chineseCabbage, 0, 'images/chineseCabbage.png'),
    FoodStuff(TextData.tomato, 0, 'images/tomato.png'),
    FoodStuff(TextData.okra, 0, 'images/okra.png'),
    FoodStuff(TextData.lettuce, 0, 'images/lettuce.png'),
    FoodStuff(TextData.shiitake, 0, 'images/shiitake.png'),
    FoodStuff(TextData.eggplant, 0, 'images/eggplant.png'),
    FoodStuff(TextData.japaneseWhiteRadish, 0, 'images/japaneseWhiteRadish.png'),
    FoodStuff(TextData.greenOnion, 0, 'images/greenOnion.png'),
    FoodStuff(TextData.cucumber, 0, 'images/cucumber.png'),
    FoodStuff(TextData.pumpkin, 0, 'images/pumpkin.png'),
    FoodStuff(TextData.potato, 0, 'images/potato.png'),
    FoodStuff(TextData.spinach, 0, 'images/spinach.png'),
  ];

  List<FoodStuff> get foodStuffList => _foodStuffList;

  void incrementAmount(index){
    if(0 > index || index >= foodStuffList.length){
      return;
    }
    foodStuffList[index].foodStuffAmount+=100;
    notifyListeners();
  }

  void decrementAmount(index){
    if(0 > index || index >= foodStuffList.length){
      return;
    }
    if(foodStuffList[index].foodStuffAmount == 0){
      return;
    }
    else if (foodStuffList[index].foodStuffAmount < 0){
      foodStuffList[index].foodStuffAmount = 0;
      notifyListeners();
    }
    else {
      foodStuffList[index].foodStuffAmount-=100;
      notifyListeners();
    }
  }
}