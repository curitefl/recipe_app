import 'package:flutter/material.dart';
import 'package:recipe_app/my_page_list_tile.dart';
import 'package:recipe_app/text_data.dart';

class MyPageListView extends StatelessWidget {
  final List<ListTileDomain> myPageListView = [
    ListTileDomain(TextData.favoriteRecipe, Icons.favorite_border),
    ListTileDomain(TextData.columns, Icons.book_outlined),
    ListTileDomain(TextData.profileEdit, Icons.perm_identity),
    ListTileDomain(TextData.mailRegistration, Icons.mail_outline),
    ListTileDomain(TextData.fridgeShare, Icons.kitchen),
    ListTileDomain(TextData.settings, Icons.settings),
  ];

  MyPageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: myPageListView.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black38),
              ),
            ),
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
    );
  }
}
