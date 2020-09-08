import 'dart:async';

import 'package:White_Bear/components/Buttons.dart';
import 'package:White_Bear/services/teddy_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class TrackButton extends StatefulWidget {
  TrackButton({Key key}) : super(key: key);

  @override
  _TrackButtonState createState() => _TrackButtonState();
}

class _TrackButtonState extends State<TrackButton> {
  GlobalKey _trackkey = new GlobalKey();
  Offset _offset;
  TeddyController _teddyController;
  Timer _debounceTimer;

  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Listener(
        onPointerDown: (PointerDownEvent event) {
          RenderBox referenceBox = _trackkey.currentContext.findRenderObject();
          Offset offset = referenceBox.globalToLocal(event.position);
          setState(() {
            _offset = offset;
          });

          if (_debounceTimer?.isActive ?? false) _debounceTimer.cancel();
          _debounceTimer = Timer(const Duration(milliseconds: 100), () {
            if (_trackkey.currentContext != null) {
              RenderBox referenceBox =
                  _trackkey.currentContext.findRenderObject();
              Offset offset = referenceBox.globalToLocal(event.position);
              setState(() {
                _offset = offset;
              });
              _teddyController.lookAt(_offset);
            }
          });
        },
        child: Container(
          key: _trackkey,
          color: Colors.lightBlue[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Reuse(
                    height: _height,
                    width: _width,
                    func: () {},
                    txt: 'Button 1',
                  ),
                  Reuse(
                    height: _height,
                    width: _width,
                    func: () {},
                    txt: 'Button 2',
                  ),
                ],
              ),
              SizedBox(
                height: _height * 0.1,
              ),
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
              SizedBox(
                height: _height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Reuse(
                    height: _height,
                    width: _width,
                    func: () {},
                    txt: 'Button 3',
                  ),
                  Reuse(
                    height: _height,
                    width: _width,
                    func: () {},
                    txt: 'Button 4',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
