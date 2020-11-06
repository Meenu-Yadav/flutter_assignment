import 'dart:math';

import 'package:assignment/models/customIcon.dart';
import 'package:assignment/models/icons.dart';
import 'package:assignment/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;

const double pi = 3.1415926535897932;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int c = -1;

  List<CustomIcon> _customIcons = List(icons.length);

  _HomeState() {
    icons.asMap().forEach((index, element) => {
          _customIcons[index] = CustomIcon(
            id: index,
            angle: 360 / icons.length * index,
            title: element['title'],
            color: element['color'],
            colorHover: element['colorHover'],
            icon: element['icon'],
            heroTag: index.toString(),
          )
        });
  }

  Widget _buildButton(CustomIcon customIcon) {
    final double rad = radians(customIcon.angle);

    Color colorFinal =
        c == customIcon.id ? customIcon.colorHover : customIcon.color;

    Color iconColor = c == customIcon.id ? Colors.black : Colors.black12;

    void onButtonDoubleTap() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Details(customIcon: customIcon)));
    }

    void onButtonSingleTap() {
      setState(() {
        c = customIcon.id;
      });
    }

    return Transform(
        transform: Matrix4.identity()
          ..translate(150 * cos(rad), 150 * sin(rad)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkResponse(
                  onTap: onButtonSingleTap,
                  onDoubleTap: onButtonDoubleTap,
                  child: new Container(
                    width: 60,
                    height: 60,
                    decoration: new BoxDecoration(
                      color: colorFinal,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      customIcon.icon,
                      color: iconColor,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _main(c) {
    if (c == -1 || c >= _customIcons.length) {
      return Container(
          width: 60,
          height: 60,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
          ));
    }
    return CircleButton(
      customIcon: _customIcons[c],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> icons = _customIcons.map((e) => _buildButton(e)).toList();

    return Scaffold(
      appBar:
          AppBar(title: Text('Assignment'), backgroundColor: Colors.red[600]),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/tachLogo.png",
              height: 125,
              width: 125,
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: MediaQuery.of(context).size.width - 100,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                  alignment: Alignment.center, children: [_main(c), ...icons]),
            )
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatefulWidget {
  final CustomIcon customIcon;

  const CircleButton({Key key, this.customIcon}) : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  void onDoubleTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Details(customIcon: widget.customIcon)));

  }

  @override
  Widget build(BuildContext context) {
    double size = 200.0;

    return new InkResponse(
      onDoubleTap: onDoubleTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: widget.customIcon.color,
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 20,
              child: new Icon(
                widget.customIcon.icon,
                size: 100,
              ),
            ),
            Positioned(
              top: 30,
              child: Text(
                widget.customIcon.title.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
