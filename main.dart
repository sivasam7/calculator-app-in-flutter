import 'package:flutter/material.dart';

void main() => runApp(Cal());

class Cal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Siva',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
              ),
            ),
            Text('Calculator',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                )),
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$text',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.w400),
                  )),
            ),
            Row(
              children: [
                customeOutlineButton('7'),
                customeOutlineButton('8'),
                customeOutlineButton('9'),
                customeOutlineButton('+'),
              ],
            ),
            Row(
              children: [
                customeOutlineButton('4'),
                customeOutlineButton('5'),
                customeOutlineButton('6'),
                customeOutlineButton('-'),
              ],
            ),
            Row(
              children: [
                customeOutlineButton('1'),
                customeOutlineButton('2'),
                customeOutlineButton('3'),
                customeOutlineButton('x'),
              ],
            ),
            Row(
              children: [
                customeOutlineButton('C'),
                customeOutlineButton('0'),
                customeOutlineButton('='),
                customeOutlineButton('/'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customeOutlineButton(String val) {
    return Expanded(
      child: OutlineButton(
          color: Colors.cyan,
          padding: EdgeInsets.all(28.8),
          onPressed: () => btnClicked(val),
          child: Text(val, style: TextStyle(fontSize: 25.0))),
    );
  }

  int first, second;
  String opp;
  String res, text = "";
  void btnClicked(String btnText) {
    if (btnText == 'C') {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }

      if (opp == "-") {
        res = (first - second).toString();
      }

      if (opp == "x") {
        res = (first * second).toString();
      }

      if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }

    setState(() {
      text = res;
    });
  }
}
