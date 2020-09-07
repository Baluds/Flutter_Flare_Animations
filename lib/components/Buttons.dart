import 'package:flutter/material.dart';

class Reuse extends StatelessWidget {
  const Reuse(
      {Key key,
      @required double height,
      @required double width,
      @required this.txt,
      @required this.func})
      : _height = height,
        _width = width,
        super(key: key);

  final double _height;
  final double _width;
  final String txt;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20.0),
      ),
      elevation: 20,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        splashColor: Colors.grey,
        onTap: func,
        child: Container(
          child: Container(
            height: _height * 0.12,
            width: _width * 0.25,
            child: Center(
              child: Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          //margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
