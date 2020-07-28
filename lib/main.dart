import 'package:flutter/material.dart';
import 'package:nt_flutter/model/travel_model.dart';
import 'package:nt_flutter/pages/detail.dart';
import 'package:nt_flutter/widgets/webview.dart';
import 'package:nt_flutter/widgets/BottomNavigationBar.dart';
import 'package:nt_flutter/widgets/drawer.dart';
import 'package:nt_flutter/widgets/fab.dart';
import 'package:nt_flutter/pages/gaodeMap.dart';
import 'package:nt_flutter/pages/googleMap.dart';
import 'package:nt_flutter/pages/list.dart';
import 'package:nt_flutter/pages/story.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nt_flutter/dao/travel_dao.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NextSticker.cn',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes:{
        "detail":(context) => Detail(),
        "story":(context) => WebView(url: 'www.baidu.com'),
      } ,
      home: MyHomePage(title: 'NextSticker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageController = PageController();
  final TextEditingController _controller = TextEditingController();
  var userData;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String userData = prefs.getString('userData');
     if(userData != null){
        setState((){
        userData = userData;
      });
     } else {
        print('no data');
     }
  }

  void getData() async {
    //try{
      TravelModel response = await TravelDao.fetch();
      if(response != null){
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('userData', response as String);
        setState(() {
          userData = response;
        });
        Navigator.of(context).pop();
        _openSnackBar('数据已导入！');
      } else {
        Navigator.of(context).pop();
        _openSnackBar('无对应编号！');
      }
    // } catch(err){
    //   print(err);
    // }
  }

  void _openDialog(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
      title: Text('请输入行程编号'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: _controller
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            _controller.text = '';
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            getData();
          },
        )
      ],
    ));
  }

  void _openDrawer(){
     _scaffoldKey.currentState.openEndDrawer();
  }

  void _openSnackBar(text){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: 2)
      )
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text(widget.title),
        actions: <Widget>[_item(userData, _selectedIndex, (userData == null ? _openDialog : _openDrawer))]
      ),
      body: PageView(
        onPageChanged: _onItemTapped,
        controller: _pageController,
        children: <Widget>[
          (userData == null ? GaodeMap(): GoogleMap()),
          MyList(),
          Story(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      endDrawer: MyDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped
      ),
      floatingActionButton: _selectedIndex == 0 ? MyFAB() : null,
    );
  }
}

Widget _item(dynamic user, int index, Function fn){
  if(index > 0){
    return Container();
  } else {
    return user == null
    ? FlatButton(child: Text('行程编号'),textColor: Colors.white, onPressed: fn)
    : IconButton(icon: Icon(Icons.dehaze), onPressed: fn);
  }
}
