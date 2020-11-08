import 'package:assignment/models/customIcon.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class Details extends StatelessWidget {
  final CustomIcon customIcon;

  Details({@required this.customIcon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tachyons'),
          backgroundColor: Colors.red[600],
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/tachLogo.png",
                  alignment: Alignment.center,
                  height: 125,
                  width: 125,
                ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: new BoxDecoration(
                      color: customIcon.colorHover,
                      shape: BoxShape.circle,
                    ),
                    child: new Icon(
                      customIcon.icon,
                      color: Colors.black,
                      size: 60,
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 300,
              decoration: BoxDecoration(color: customIcon.colorHover),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: new BoxDecoration(
                            color: customIcon.colorHover,
                            shape: BoxShape.circle,
                          ),
                          child: new Icon(
                            customIcon.icon,
                            color: Colors.black,
                            size: 60,
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(customIcon.title.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(
                          lipsum.createText(numParagraphs: 1, numSentences: 5),
                          style:
                              TextStyle(color: Colors.grey[600], height: 1.4))),
                ],
              ),
            ),
          ],
        ));
  }
}
