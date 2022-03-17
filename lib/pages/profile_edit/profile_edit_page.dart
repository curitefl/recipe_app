import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/profile_edit/profile_edit_page_model.dart';
import 'package:recipe_app/text_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileEditPage extends StatelessWidget {
  final String title;
  final List<String> _servings = List.generate(10, (index) => '${index + 1}');

  ProfileEditPage({Key? key, required this.title}) : super(key: key);

  void _cupertinoPicker(BuildContext context) {
    ProfileEditPageModel readModel = context.read<ProfileEditPageModel>();
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 250.0.h,
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
                  itemExtent: 30.0.h,
                  children: _servings.map((number) => Text(number)).toList(),
                  onSelectedItemChanged: (index) {
                    readModel.selectServings(_servings[index]);
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
    ProfileEditPageModel readModel = context.read<ProfileEditPageModel>();
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        final String? birthday = readModel.getDateOfBirth();
        if(birthday == null) {
          return const CircularProgressIndicator();
        }
        final birthdayArray = birthday.split('/');
        assert(birthdayArray.length == 3, TextData.needThreeLength);
        final year = int.parse(birthdayArray[0]);
        final month = int.parse(birthdayArray[1]);
        final day = int.parse(birthdayArray[2]);

        return Container(
          height: 500.0.h,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 400.0.h,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  dateOrder: DatePickerDateOrder.ymd,
                  minimumYear: 1900,
                  maximumYear: DateTime.now().year,
                  initialDateTime: DateTime(year, month, day),
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
                      decoration: InputDecoration(
                        hintText: TextData.nickname,
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
                    SizedBox(
                      height: 20.0.h,
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
                    SizedBox(
                      height: 20.0.h,
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
                              final String? birthday = model.getDateOfBirth();
                              if(birthday == null) {
                                return const CircularProgressIndicator();
                              }
                              final birthdayArray = birthday.split('/');
                              assert(birthdayArray.length == 3, TextData.needThreeLength);
                              final year = int.parse(birthdayArray[0]);
                              final month = int.parse(birthdayArray[1]);
                              final day = int.parse(birthdayArray[2]);
                              return Text(
                                  '${year.toString()}${TextData.year}${month.toString()}${TextData.month}${day.toString()}${TextData.day}');
                            },
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        child: const Text(TextData.apply),
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
