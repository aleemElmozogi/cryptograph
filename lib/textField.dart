import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldS extends StatelessWidget {
  const TextFieldS({
    Key? key,
    required TextEditingController inputTextController,
    required this.hintText,
  })  : _inputTextController = inputTextController,
        super(key: key);

  final TextEditingController _inputTextController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: TextField(
        controller: _inputTextController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          filled: true, //<-- SEE HERE
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
