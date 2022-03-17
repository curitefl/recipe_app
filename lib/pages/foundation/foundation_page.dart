import 'package:flutter/material.dart';
import 'package:recipe_app/screen_arguments.dart';
import 'package:recipe_app/text_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoundationPage extends StatelessWidget {
  final String title;
  static const List<String> _foundationPageListView = [
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: AppBar(
          centerTitle: true,
          title: Text(title),
          titleTextStyle: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.pink,
                ),
                hintText: TextData.search,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2.0.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2.0.w,
                  ),
                ),
              ),
            ),
          ),
          Material(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _foundationPageListView.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black38),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: ListTile(
                      title: Text(_foundationPageListView[index]),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.pushNamed(context, '/${TextData.webViewPage}',
                          arguments: ScreenArguments(_foundationPageListView[index],
                          ),);
                        // Navigator.of(context).pushNamed('/${TextData.webViewPage}');
                      },
                    ),
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
