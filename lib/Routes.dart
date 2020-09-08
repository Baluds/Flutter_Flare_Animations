import 'package:White_Bear/components/Buttons.dart';
import 'package:White_Bear/screens/ButtonTrack.dart';
import 'package:White_Bear/screens/Loginpage.dart';
import 'package:White_Bear/screens/animations.dart';
import 'package:White_Bear/screens/screentrack.dart';
import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  Routes({Key key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Responsive Animations',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
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
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loginpg(),
                      ),
                    );
                  },
                  txt: 'Login',
                ),
                Reuse(
                  height: _height,
                  width: _width,
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Animationspg(),
                      ),
                    );
                  },
                  txt: 'Animate',
                ),
              ],
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
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screentrackpg(),
                      ),
                    );
                  },
                  txt: 'Screen\nTrack',
                ),
                Reuse(
                  height: _height,
                  width: _width,
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrackButtonpg(),
                      ),
                    );
                  },
                  txt: 'Button\nTrack',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
