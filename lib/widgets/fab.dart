import 'package:flutter/material.dart';

class MyFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        
      },
      tooltip: 'Location',
      child: Icon(Icons.location_searching),
    );
  }
}