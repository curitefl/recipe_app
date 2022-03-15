import 'package:flutter/material.dart';
import 'package:recipe_app/my_page_list_tile.dart';
import 'package:recipe_app/text_data.dart';

class HomePage extends StatelessWidget {
  final List<ListTileDomain> _homePageListView = [
    ListTileDomain(TextData.home, Icons.home_outlined),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: _homePageListView.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black38),
              ),
            ),
            child: ListTile(
              leading: Icon(_homePageListView[index].icon),
              title: Text(_homePageListView[index].text),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pushNamed('/${_homePageListView[index].text}');
              },
            ),
          );
        },
      ),
    );
  }
}
