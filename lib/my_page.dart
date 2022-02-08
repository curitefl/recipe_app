import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_page_list_tile.dart';

class MyPage extends StatelessWidget {
  final String title;

  final List<MyPageListTile> myPageListView = [
    MyPageListTile('お気に入りレシピ', Icons.favorite_border),
    MyPageListTile('コラム', Icons.book_outlined),
    MyPageListTile('プロフィール変更', Icons.perm_identity),
    MyPageListTile('メールアドレス登録', Icons.mail_outline),
    MyPageListTile('冷蔵庫共有', Icons.kitchen),
    MyPageListTile('設定', Icons.settings),
  ];
  static const List<String> bottomBarLabels = [
    'ホーム',
    '食材',
    'レシピ',
    'レポート',
    'マイページ',
  ];
  static const List<IconData> bottomBarIcons = [
    Icons.home_outlined,
    Icons.kitchen,
    Icons.blender,
    Icons.analytics_outlined,
    Icons.perm_identity,
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
              )),
              child: ListTile(
                leading: Icon(myPageListView[index].icon),
                title: Text(myPageListView[index].text),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  //TODO
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 4,
        items: [
          BottomNavigationBarItem(label: bottomBarLabels[0], icon: Icon(bottomBarIcons[0])),
          BottomNavigationBarItem(label: bottomBarLabels[1], icon: Icon(bottomBarIcons[1])),
          BottomNavigationBarItem(label: bottomBarLabels[2], icon: Icon(bottomBarIcons[2])),
          BottomNavigationBarItem(label: bottomBarLabels[3], icon: Icon(bottomBarIcons[3])),
          BottomNavigationBarItem(label: bottomBarLabels[4], icon: Icon(bottomBarIcons[4])),
        ],
      ),
    );
  }
}