import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function onItemTapped;
  void _onItemTapped(int index){
    onItemTapped(index);
  }
  MyBottomNavigationBar({
    Key key,
    @required this.selectedIndex, 
    @required this.onItemTapped
    }): super(key: key);
  @override
  Widget build(BuildContext context) {
  return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('地图')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('行程')),
        BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('故事')),
      ],
      currentIndex: selectedIndex,
      fixedColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}