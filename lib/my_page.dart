import 'package:flutter/material.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/bottom_bar_item.dart';
import 'package:recipe_app/my_page_list_tile.dart';

class MyPage extends StatelessWidget {
  final String title;

  final List<MyPageListTile> myPageListView = [
    MyPageListTile(TextData.favoriteRecipe, Icons.favorite_border),
    MyPageListTile(TextData.columns, Icons.book_outlined),
    MyPageListTile(TextData.profileEdit, Icons.perm_identity),
    MyPageListTile(TextData.mailRegistration, Icons.mail_outline),
    MyPageListTile(TextData.fridgeShare, Icons.kitchen),
    MyPageListTile(TextData.settings, Icons.settings),
  ];
  final List<BottomBarItem> bottomBarItems = [
    BottomBarItem(TextData.home, Icons.home_outlined),
    BottomBarItem(TextData.foodStuffs, Icons.kitchen),
    BottomBarItem(TextData.recipes, Icons.blender),
    BottomBarItem(TextData.report, Icons.analytics_outlined),
    BottomBarItem(TextData.myPage, Icons.perm_identity),
  ];

  MyPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Material(
        child: ListView.builder(
          itemCount: myPageListView.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.black38),
              ),),
              child: ListTile(
                leading: Icon(myPageListView[index].icon),
                title: Text(myPageListView[index].text),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pushNamed('/${myPageListView[index].text}');
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white,
        currentIndex: 4,
        items: [
          for( int i = 0; i < bottomBarItems.length; i++)...{
            BottomNavigationBarItem(label: bottomBarItems[i].label, icon: Icon(bottomBarItems[i].icon)),
          }
        ],
      ),
    );
  }
}