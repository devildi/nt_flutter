import 'package:flutter/material.dart';
import 'package:nt_flutter/widgets/expanmenu.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('详细行程：'),
        ),
        body: ExpansionTileSample()
      )
    );
  }
}