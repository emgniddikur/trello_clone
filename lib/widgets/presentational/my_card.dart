import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key key,
    @required double width,
    @required Widget child,
  })  : _width = width,
        _child = child,
        super(key: key);

  final double _width;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 8.0,
            offset: Offset(0, 0),
            color: Color.fromRGBO(127, 140, 141, 0.5),
            spreadRadius: 2.0)
      ], borderRadius: BorderRadius.circular(4.0), color: Colors.white),
      child: _child,
    );
  }
}
