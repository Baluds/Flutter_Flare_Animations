import 'dart:async';
import 'dart:typed_data';

import 'dart:ui' as UI;
import 'package:White_Bear/services/teddy_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screentrack extends StatefulWidget {
  Screentrack({Key key}) : super(key: key);

  @override
  _ScreentrackState createState() => _ScreentrackState();
}

class _ScreentrackState extends State<Screentrack> {
  GlobalKey _paintKey = new GlobalKey();
  Offset _offset;
  TeddyController _teddyController;
  Timer _debounceTimer;
  UI.Image _image;
  _loadImage() async {
    ByteData bd = await rootBundle.load("assets/ball.png");

    final Uint8List bytes = Uint8List.view(bd.buffer);

    final UI.Codec codec = await UI.instantiateImageCodec(bytes);

    final UI.Image image = (await codec.getNextFrame()).image;

    setState(() => _image = image);
  }

  @override
  initState() {
    _loadImage();
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Listener(
        onPointerDown: (PointerDownEvent event) {
          RenderBox referenceBox = _paintKey.currentContext.findRenderObject();
          Offset offset = referenceBox.globalToLocal(event.position);
          setState(() {
            _offset = offset;
          });

          if (_debounceTimer?.isActive ?? false) _debounceTimer.cancel();
          _debounceTimer = Timer(const Duration(milliseconds: 100), () {
            if (_paintKey.currentContext != null) {
              RenderBox referenceBox =
                  _paintKey.currentContext.findRenderObject();
              Offset offset = referenceBox.globalToLocal(event.position);
              setState(() {
                _offset = offset;
              });
              _teddyController.lookAt(_offset);
            }
          });
        },
        child: CustomPaint(
          //To remove ball just use conatainer instead of custompaint
          //and uncomment color property
          painter: new MyCustomPainter(_offset, _image),
          key: _paintKey,
          // height: _height * 0.98,
          // width: _width * 0.99,
          //color: Colors.lightBlue[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: _height * 0.37,
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: FlareActor(
                  "assets/Am_bearv1.flr",
                  shouldClip: false,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitHeight,
                  controller: _teddyController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  UI.Image image;
  final Offset _offset;
  MyCustomPainter(this._offset, this.image);

  @override
  void paint(Canvas canvas, Size size) async {
    if (_offset == null) return;

    if (image != null) {
      canvas.drawImage(image, _offset, Paint());
    }
  }

  @override
  bool shouldRepaint(MyCustomPainter other) => other._offset != _offset;
}
