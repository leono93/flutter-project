import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bordered_text/bordered_text.dart';
import '../descriptions/dkDesc.dart';

const playerClass = 'death-knight';
const className = 'Death Knight';
const classDescription =
    'Death Knights engage their foes up-close, supplementing swings of their weapons with dark magic that renders enemies vulnerable or damages them with unholy power. They drag foes into one-on-one conflicts, compelling them to focus their attacks away from weaker companions. To prevent their enemies from fleeing their grasp, death knights must remain mindful of the power they call forth from runes, and pace their attacks appropriately.';
const spec1 = 'blood';
const spec2 = 'frost';
const spec3 = 'unholy';

_redirectOfficial() async {
  const url = 'https://worldofwarcraft.com/en-gb/game/classes/$playerClass';
  const errorMsg = 'Oops! Something went wrong while trying to launch $url';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw errorMsg;
  }
}

_redirectRio() async {
  const url =
      'https://raider.io/mythic-plus-character-rankings/season-bfa-4-post/world/$playerClass/all';
  const errorMsg = 'Oops! Something went wrong while trying to launch $url';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw errorMsg;
  }
}

_redirectWowhead() async {
  const url = 'https://www.wowhead.com/$playerClass';
  const errorMsg = 'Oops! Something went wrong while trying to launch $url';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw errorMsg;
  }
}

class DeathKnight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(children: <Widget>[
        new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$playerClass.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
            alignment: FractionalOffset(0.5, 0.1),
            child: BorderedText(
                strokeWidth: 1.8,
                strokeColor: Colors.black,
                child: Text('$className',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'MORPHEUS',
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900],
                        shadows: [
                          Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(5.0, 5.0))
                        ])))),
        Align(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            Container(
              height: 50,
              color: Color(0xff9c9c9c).withOpacity(0.3),
              child: Align(
                  child: BorderedText(
                      strokeWidth: 2.0,
                      strokeColor: Colors.black,
                      child: Text('$className 1',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    blurRadius: 9.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0))
                              ])))),
            ),
            Container(
                height: 50,
                color: Color(0xff9c9c9c).withOpacity(0.3),
                child: Align(
                  child: BorderedText(
                      strokeWidth: 2.0,
                      strokeColor: Colors.black,
                      child: Text('$className 2',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    blurRadius: 9.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0))
                              ]))),
                )),
            Container(
              height: 50,
              color: Color(0xff9c9c9c).withOpacity(0.3),
              child: Align(
                  child: BorderedText(
                      strokeWidth: 2.0,
                      strokeColor: Colors.black,
                      child: Text('$className 3',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    blurRadius: 9.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0))
                              ])))),
            ),
          ],
        ))),
        Align(
            alignment: FractionalOffset(0.5, 0.85),
            child: Container(
                height: 75,
                width: 175,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        onPressed: _redirectOfficial,
                        icon: Image.asset("assets/wowicon.png"),
                      ),
                      IconButton(
                          onPressed: _redirectRio,
                          icon: Image.asset("assets/raiderio.png")),
                      IconButton(
                        onPressed: _redirectWowhead,
                        icon: Image.asset("assets/wowhead.png"),
                      )
                    ]))),
        new Container(
          alignment: FractionalOffset(0.05, 0.995),
          child: new RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Class Selection',
              style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'MORPHEUS',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        new Container(
          alignment: FractionalOffset(0.5, 0.995),
          child: ButtonTheme(
              minWidth: 30,
              height: 36,
              buttonColor: Color(0xffe0e0e0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeathKnightDesc()),
                  );
                },
                child: Text(
                  'ⓘ',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'MORPHEUS',
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
        new Container(
          alignment: FractionalOffset(0.95, 0.995),
          child: new RaisedButton(
            onPressed: () {},
            child: Text(
              'Add Character',
              style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'MORPHEUS',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
