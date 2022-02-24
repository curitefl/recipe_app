import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/sub_pages/profile_edit_page_model.dart';
import 'package:recipe_app/text_data.dart';

class ProfileEditPage extends StatelessWidget {
  final String title;
  final List<String> servings = List.generate(10, (index) => '${index + 1}');

  ProfileEditPage({Key? key, required this.title}) : super(key: key);

  void _cupertinoPicker(BuildContext context) {
    ProfileEditPageModel readModel = context.read<ProfileEditPageModel>();
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
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
                  scrollController: FixedExtentScrollController(
                    initialItem: int.parse(readModel.getServingsController().text) - 1,
                  ),
                  looping: false,
                  itemExtent: 30.0,
                  children: servings.map((number) => Text(number)).toList(),
                  onSelectedItemChanged: (index) {
                    readModel.selectServings(servings[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _cupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        final ProfileEditPageModel readModel = context.read<ProfileEditPageModel>();
        final DateTime? dateOfBirth = readModel.getDateOfBirth();
        if (dateOfBirth == null) {
          return const CircularProgressIndicator();
        }

        return Container(
          height: 500.0,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 400.0,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  dateOrder: DatePickerDateOrder.ymd,
                  minimumYear: 1900,
                  maximumYear: DateTime.now().year,
                  initialDateTime: DateTime(dateOfBirth.year, dateOfBirth.month, dateOfBirth.day),
                  onDateTimeChanged: (DateTime selectedDate) {
                    readModel.selectDateOfBirth(selectedDate);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ProfileEditPageModel>(
              builder: (context, model, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(TextData.required),
                    TextField(
                      controller: model.getNicknameController(),
                      onSubmitted: (text) {
                        model.setNickname(text);
                      },
                      decoration: const InputDecoration(
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
                            _cupertinoPicker(context);
                          },
                          child: Consumer<ProfileEditPageModel>(
                            builder: (context, model, child) => Text(model.getServingsController().text),
                          ),
                        ),
                        const Text(TextData.people),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        const Text(TextData.birth),
                        OutlinedButton(
                          onPressed: () {
                            _cupertinoDatePicker(context);
                          },
                          child: Consumer<ProfileEditPageModel>(
                            builder: (context, model, child) {
                              if(model.getDateOfBirth()?.year == null ||
                                  model.getDateOfBirth()?.month == null ||
                                  model.getDateOfBirth()?.day == null) {
                                return const CircularProgressIndicator();
                              }
                              return Text('${model.getDateOfBirth()!.year.toString()}年'
                                  '${model.getDateOfBirth()!.month.toString()}月'
                                  '${model.getDateOfBirth()!.day.toString()}日');
                            },
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        child: const Text('変更する'),
                        onPressed: () {
                          model.updateProfile();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
