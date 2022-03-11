import 'package:flutter/cupertino.dart';
import 'package:recipe_app/food_stuff.dart';

class FoodStuffsPageModel extends ChangeNotifier {
  List<FoodStuff> foodStuffList = [
    FoodStuff('たまねぎ', 0, 'https://illust8.com/wp-content/uploads/2021/03/cute_onion_character_12780.png'),
    FoodStuff('にんじん', 0, 'https://2.bp.blogspot.com/-DtSJnl7qXOU/Uvy6GUibHyI/AAAAAAAAdvY/7um8FrPC-BM/s800/character_ninjin.png'),
    FoodStuff('ごぼう', 0, 'https://ha-chi.biz/upim/p888.png'),
    FoodStuff('白菜', 0, 'https://2.bp.blogspot.com/-9u7S1mBPfPs/Uvy6A-3TtvI/AAAAAAAAdt4/f2VMwChVOSI/s800/character_hakusai.png'),
    FoodStuff('トマト', 0, 'http://illustrain.com/img/work/2016/illustrain08-vegetable05.png'),
    FoodStuff('オクラ', 0, 'https://illust8.com/wp-content/uploads/2021/03/cute_okura_character_12898.png'),
    FoodStuff('レタス', 0, 'https://illust8.com/wp-content/uploads/2021/03/cute_lettuce_character_12897.png'),
    FoodStuff('しいたけ', 0, 'https://illust8.com/wp-content/uploads/2021/03/cute_shiitake_character_12911.png'),
    FoodStuff('ナス', 0, 'http://illustrain.com/img/work/2016/illustrain08-vegetable07.png'),
    FoodStuff('大根', 0, 'https://1.bp.blogspot.com/-XlUrCp6n3hA/Uvy5-1JuN4I/AAAAAAAAdtc/HGqLP5ZrtyY/s800/character_daikon.png'),
    FoodStuff('ネギ', 0, 'https://1.bp.blogspot.com/-ERexWTheuT4/Uvy6GdhAoCI/AAAAAAAAdvU/5wV2G2l3DXM/s800/character_negi.png'),
    FoodStuff('きゅうり', 0, 'https://illust8.com/wp-content/uploads/2021/03/cute_kyuuri_character_12786.png'),
    FoodStuff('かぼちゃ', 0, 'https://illust8.com/wp-content/uploads/2021/03/cute_pumpkin_character_12782.png'),
    FoodStuff('じゃがいも', 0, 'https://hiyokoyarou.com/wp-content/uploads/2017/09/jagaimokun.png'),
    FoodStuff('ほうれん草', 0, 'https://illust8.com/wp-content/uploads/2021/03/cute_hourensou_character_12870.png'),
  ];

  void incrementAmount(index){
    foodStuffList[index].foodStuffAmount+=100;
    notifyListeners();
  }
  void decrementAmount(index){
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