import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final Function() _onPressed;
  final String _title;
  const WidgetButton({Key? key, required String title, required Function() onPressed})
      : _onPressed = onPressed,
        _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(10),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(color: Colors.white)),
        shadowColor: MaterialStateProperty.all<Color>(Colors.black54),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      onPressed: () => _onPressed(),
      child: Text(_title),
    );
  }
}
