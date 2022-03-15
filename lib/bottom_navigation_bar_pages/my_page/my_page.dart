import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/food_stuffs/food_stuffs_page.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/home/home_page.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/my_page/my_page_list_view.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/recipe_page.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/reports/reports_page.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/bottom_bar_item.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/my_page/my_page_model.dart';
import 'package:recipe_app/text_data.dart';

class MyPage extends StatelessWidget {
  final String title;

  final List<BottomBarItem> _bottomBarItems = [
    BottomBarItem(TextData.home, Icons.home_outlined, HomePage()),
    BottomBarItem(TextData.foodStuffs, Icons.kitchen, const FoodStuffsPage()),
    BottomBarItem(TextData.recipes, Icons.blender, RecipePage()),
    BottomBarItem(TextData.report, Icons.analytics_outlined, ReportsPage()),
    BottomBarItem(TextData.myPage, Icons.perm_identity, MyPageListView()),
  ];

  MyPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyPageModel>(
      builder: (context, model, child) {
        return WillPopScope(
          onWillPop: () => model.backButtonPress(),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(_bottomBarItems[model.selectedIndex].label),
            ),
            body: PageView(
              children: _bottomBarItems.map((widget) => widget.page).toList(),
              controller: model.pageController,
              onPageChanged: model.onItemTapped,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.amber,
              selectedItemColor: Colors.black54,
              unselectedItemColor: Colors.white,
              currentIndex: model.selectedIndex,
              onTap: model.onItemTapped,
              items: [
                for (int i = 0; i < _bottomBarItems.length; i++) ...{
                  BottomNavigationBarItem(
                      label: _bottomBarItems[i].label, icon: Icon(_bottomBarItems[i].icon)),
                }
              ],
            ),
          ),
        );
      }
    );
  }
}