import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key key,
    @required String text,
    @required Function onPressed,
  })  : _text = text,
        _onPressed = onPressed,
        super(key: key);

  final String _text;
  final Function _onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: RaisedButton(
        child: Text(_text),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        onPressed: () {
          _onPressed();
        },
      ),
    );
  }
}
