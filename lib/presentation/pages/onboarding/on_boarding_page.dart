import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';
import 'package:wheel_slider/wheel_slider.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  final TextEditingController _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: SimpleFoodTrackerColor.backgroundColor,
          height: MediaQuery.of(context).padding.top,
        ),
        Flexible(
          child: IntroductionScreen(
            globalBackgroundColor: SimpleFoodTrackerColor.backgroundColor,
            showDoneButton: true,
            showNextButton: true,
            showBackButton: true,
            freeze: true,
            onDone: () {
              Navigator.pushNamed(context, '/home');
            },
            done: const SizedBox.shrink(),
            next: const SizedBox.shrink(),
            back: const SizedBox.shrink(),
            pages: [
              _buildPersonalInfoPage(context: context),
              _buildHeightAndWidthPage(),
              _buildPalValuePage(),
            ],
          ),
        ),
      ],
    );
  }

  PageViewModel _buildPersonalInfoPage({
    required BuildContext context,
  }) {
    const List<String> gender = ['male', 'female'];

    return PageViewModel(
      title: 'Personal Information',
      bodyWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name'),
            TextField(
              controller: _nameTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: SimpleFoodTrackerColor.clickAbleColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: SimpleFoodTrackerColor.clickAbleColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
              ),
            ),
            const Text('Birthday'),
            GestureDetector(
              onTap: () => _showDatePicker(context: context),
              child: Container(
                width: 200,
                height: 30,
                color: Colors.red,
              ),
            ),
            const Text('gender'),
            Column(
              children: [
                ListTile(
                  title: const Text('male'),
                  leading: Radio(
                    value: gender[0],
                    groupValue: gender[0], //TODO: add bloc
                    onChanged: (_) {},
                  ),
                ),
                ListTile(
                  title: const Text('female'),
                  leading: Radio(
                    value: gender[1],
                    groupValue: gender[0],
                    onChanged: (_) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker({
    required BuildContext context,
  }) {
    BottomPicker.date(
      pickerTitle: const Text(''),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  PageViewModel _buildHeightAndWidthPage() {
    return PageViewModel(
      title: 'Körpermaße',
      bodyWidget: Column(
        children: [
          const Text('Height'),
          WheelSlider(
            isVibrate: false,
            enableAnimation: false,
            totalCount: 300,
            initValue: 150,
            onValueChanged: (value) {},
          ),
          const Text('Weight'),
          WheelSlider(
            isVibrate: false,
            enableAnimation: false,
            totalCount: 200,
            initValue: 70,
            onValueChanged: (value) {},
          ),
        ],
      ),
    );
  }

  PageViewModel _buildPalValuePage() {
    return PageViewModel(
      title: 'Pal Value',
      bodyWidget: const TextField(),
    );
  }
}
