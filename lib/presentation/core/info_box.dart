import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_food_tracker/application/addmeal/add_meal_bloc.dart';

class InfoBox extends StatelessWidget {
  final AddMealState _state;
  final Color _backgroundColor;
  final String _imagePath;
  final Widget _text;

  const InfoBox({
    super.key,
    required AddMealState state,
    required Color backgroundColor,
    required String imagePath,
    required Widget text,
  })  : _text = text,
        _imagePath = imagePath,
        _state = state,
        _backgroundColor = backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            _imagePath,
            height: 40.0,
            width: 40.0,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 6.0),
          _text,
        ],
      ),
    );
  }
}

class EditableInfoBox extends StatefulWidget {
  final AddMealState _state;
  final Color _backgroundColor;
  final String _imagePath;

  const EditableInfoBox({
    super.key,
    required AddMealState state,
    required Color backgroundColor,
    required String imagePath,
  })  : _imagePath = imagePath,
        _backgroundColor = backgroundColor,
        _state = state;

  @override
  State<EditableInfoBox> createState() => _EditableInfoBoxState();
}

class _EditableInfoBoxState extends State<EditableInfoBox> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_focusNode),
      child: InfoBox(
        state: widget._state,
        backgroundColor: widget._backgroundColor,
        imagePath: widget._imagePath,
        text: SizedBox(
          height: 15,
          child: TextField(
            focusNode: _focusNode,
            controller: _textEditingController,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            cursorWidth: 0.0,
            inputFormatters: [
              LengthLimitingTextInputFormatter(9),
            ],
          ),
        ),
      ),
    );
  }
}
