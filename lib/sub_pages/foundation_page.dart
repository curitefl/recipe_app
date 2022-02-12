import 'package:flutter/material.dart';
import 'package:recipe_app/text_data.dart';

class FoundationPage extends StatelessWidget {
  final String title;
  static const List<String> foundationPageListView = [
    TextData.seasonalFoodStuffs,
    TextData.cookingBasics,
    TextData.nutrients,
    TextData.seasoning,
    TextData.others,
  ];

  const FoundationPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Colors.pink,
                ),
                hintText: TextData.search,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Material(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: foundationPageListView.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black38),
                    ),
                  ),
                  child: ListTile(
                    title: Text(foundationPageListView[index]),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // TODO
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
