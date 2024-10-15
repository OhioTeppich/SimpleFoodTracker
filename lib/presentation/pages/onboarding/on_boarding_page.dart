import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wheel_slider/wheel_slider.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  final TextEditingController _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showDoneButton: true,
      showNextButton: true,
      showBackButton: true,
      freeze: true,
      onDone: () {
        Navigator.pushNamed(context, '/home');
        var name = _nameTextController.text;
      },
      done: Container(
        color: Colors.purple,
        height: 50,
        width: 50,
      ),
      next: Container(
        color: Colors.red,
        height: 50,
        width: 50,
      ),
      back: Container(
        color: Colors.blue,
        height: 50,
        width: 50,
      ),
      pages: [
        _buildPersonalInfoPage(context: context),
        _buildHeightAndWidthPage(),
        _buildPalValuePage(),
      ],
    );
  }

  PageViewModel _buildPersonalInfoPage({
    required BuildContext context,
  }) {
    const List<String> gender = ['male', 'female'];

    return PageViewModel(
      title: 'Personal Information',
      bodyWidget: Column(
        children: [
          const Text('Name'),
          TextField(
            controller: _nameTextController,
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
            totalCount: 300,
            initValue: 150,
            onValueChanged: (value) {},
          ),
          const Text('Weight'),
          WheelSlider(
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
