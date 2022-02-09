import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/sub_pages/profile_page_model.dart';

import '../text_data.dart';

class ProfileEditPage extends StatelessWidget {
  final String title;
  final List<String> numberOfPeople = List.generate(10, (index) => '${index+1}');

  ProfileEditPage({Key? key, required this.title}) : super(key: key);

  void _cupertinoPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          //Pickerの高さを指定。指定しない場合はフルスクリーン。
          height: 250.0,
          color: Colors.white,
          child: Column(
            children: [
              TextButton(
                child: const Text(TextData.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Divider(),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: int.parse(model.initNumber) - 1,),
                  looping: false,
                  itemExtent: 30.0,
                  children:
                      numberOfPeople.map((number) => Text(number)).toList(),
                  onSelectedItemChanged: (index) {
                    model.selectNumberOfPeople(numberOfPeople[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfilePageModel(),
      child: Consumer<ProfilePageModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(title),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(TextData.required),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: TextData.nickName,
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        const Text(TextData.usualAmount),
                        OutlinedButton(
                          onPressed: () {
                            _cupertinoPicker(context, model);
                          },
                          child: Text(Provider.of<ProfilePageModel>(context).initNumber),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
