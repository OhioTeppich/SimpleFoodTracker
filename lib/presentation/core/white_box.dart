import 'package:flutter/material.dart';
import 'package:simple_food_tracker/presentation/core/custom_button.dart';

enum ImagePosition { left, right }

class WhiteBox extends StatelessWidget {
  final String _text;
  final Widget? _image;
  final ImagePosition _imagePosition;
  final void Function()? _onTap;

  const WhiteBox({
    super.key,
    required String text,
    Widget? image,
    ImagePosition imagePosition = ImagePosition.left,
    void Function()? onTap,
  })  : _onTap = onTap,
        _imagePosition = imagePosition,
        _image = image,
        _text = text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: Container(
          height: 130,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            alignment: _imagePosition == ImagePosition.left
                ? Alignment.centerRight
                : Alignment.centerLeft,
            children: [
              if (_image != null)
                Align(
                  alignment: _imagePosition == ImagePosition.left
                      ? Alignment.bottomLeft
                      : Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 8.0,
                    ),
                    child: _image,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _text,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: const Text(
                        '+ Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                        ),
                      ),
                      onTap: _onTap,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26.0,
                        vertical: 12.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
