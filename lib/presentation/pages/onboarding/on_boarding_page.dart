import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

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
        PageViewModel(
          title: 'Name',
          bodyWidget: TextField(
            controller: _nameTextController,
          ),
        ),
        PageViewModel(
          title: 'Height',
          bodyWidget: TextField(),
        ),
        PageViewModel(
          title: 'Age',
          bodyWidget: TextField(),
        ),
      ],
    );
  }
}
