import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index){
        return GestureDetector(
          onTap: (){Navigator.pushNamed(context, "detail");},
          child: Stack(
            children: <Widget>[
              Image.network(
                'http://youimg1.c-ctrip.com/target/fd/tg/g4/M0A/CA/30/CggYHlbEXmaAYGfJAAnFAUl5-Pk911.jpg',
                width: MediaQuery.of(context).size.width,
                height: 180,
                fit: BoxFit.cover,
              ),
              Center(
                child: Container(
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('青岛浮生3日',style: TextStyle(fontSize: 20.0,color: Colors.white)),
                      Text('by:  DevilDI',style: TextStyle(fontSize: 15.0,color: Colors.white)),
                    ],
                  ),
                )
              )
            ]
          ),
        );
      },
    );
  }
}