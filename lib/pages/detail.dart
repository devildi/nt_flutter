import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详细行程')),
      body: ListView(children: <Widget>[
        Image.network(
          'http://youimg1.c-ctrip.com/target/fd/tg/g4/M0A/CA/30/CggYHlbEXmaAYGfJAAnFAUl5-Pk911.jpg',
          width: MediaQuery.of(context).size.width,
          height: 180,
          fit: BoxFit.cover,
        ),
        _item()
      ],)
    );
  }
}

Widget _item () {
  return Padding(
    padding: EdgeInsets.all(3.0),
    child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          ClipOval(child: Container(
            color: Colors.blue,
            width: 65,
            height: 65,
            child: Center(child: Text('Day 1',style: TextStyle(fontSize: 20.0,color: Colors.white)))
          )),
          Expanded(
            child: Card(
              elevation: 3,
              child: Container(
                margin:EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('故宫',style: TextStyle(fontSize: 30.0)),
                        Text('沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感',style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('故宫',style: TextStyle(fontSize: 30.0)),
                        Text('沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感',style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('故宫',style: TextStyle(fontSize: 30.0)),
                        Text('沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感',style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('故宫',style: TextStyle(fontSize: 30.0)),
                        Text('沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感',style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('故宫',style: TextStyle(fontSize: 30.0)),
                        Text('沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感沈阳帝王灵感',style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
        ));
}