//All the animations can be played here
import 'package:White_Bear/components/Buttons.dart';
import 'package:White_Bear/services/teddy_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Animationspg extends StatefulWidget {
  Animationspg({Key key}) : super(key: key);

  @override
  _AnimationspgState createState() => _AnimationspgState();
}

class _AnimationspgState extends State<Animationspg> {
  TeddyController _teddyController;
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: _height * 0.37,
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: FlareActor(
                "assets/Am_bear.flr",
                shouldClip: false,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitHeight,
                controller: _teddyController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Reuse(
                  height: _height,
                  width: _width,
                  func: () {
                    _teddyController.anime('shy');
                  },
                  txt: 'Wave',
                ),
                Reuse(
                  height: _height,
                  width: _width,
                  func: () {
                    _teddyController.anime('heart');
                  },
                  txt: 'Happy',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Reuse(
                  height: _height,
                  width: _width,
                  func: () {
                    _teddyController.anime('flying');
                  },
                  txt: 'Follow',
                ),
                Reuse(
                  height: _height,
                  width: _width,
                  func: () {
                    _teddyController.anime('blink');
                  },
                  txt: 'Wink',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Reuse(
                  height: _height,
                  width: _width,
                  func: () {
                    _teddyController.anime('Home');
                  },
                  txt: 'Happy++',
                ),
                Reuse(
                  height: _height,
                  width: _width,
                  func: () {
                    _teddyController.anime('fail');
                  },
                  txt: 'Sad',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
