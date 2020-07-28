import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nt_flutter/widgets/webview.dart';
List pic = [
	'https://tse3-mm.cn.bing.net/th/id/OIP.RiVuBdPbyZfUqwaC_rMgaAHaFj?w=200&h=189&c=7&o=5&dpr=2&pid=1.7',
	'https://tse3-mm.cn.bing.net/th/id/OIP.PjwD3caT4zGrmyx5OSmsXQHaE7?w=285&h=185&c=7&o=5&dpr=2&pid=1.7',
	'https://tse4-mm.cn.bing.net/th/id/OIP.D9KCoJ2Szl3p8iiUt1XQ7wHaJQ?w=166&h=198&c=7&o=5&dpr=2&pid=1.7',
	'https://tse2-mm.cn.bing.net/th/id/OIP.SAwRQOIAiwRcVE35WAu3lgHaEK?w=293&h=164&c=7&o=5&dpr=2&pid=1.7',
	'https://tse2-mm.cn.bing.net/th/id/OIP.kzjuEOfhlRGHlAU7XTcRtgHaNJ?w=115&h=184&c=7&o=5&dpr=2&pid=1.7',
	'https://tse3-mm.cn.bing.net/th/id/OIP.rb333I9ISUGd2y2bjn-qiQAAAA?w=299&h=194&c=7&o=5&dpr=2&pid=1.7',
	'https://tse3-mm.cn.bing.net/th/id/OIP.qEiMn_h7rMBHf9QlQw8k2QHaEo?w=260&h=162&c=7&o=5&dpr=2&pid=1.7',
	'https://tse2-mm.cn.bing.net/th/id/OIP._-DDuCgiElSuM37yuL-x9wHaE4?w=275&h=177&c=7&o=5&dpr=2&pid=1.7',
	'https://tse3-mm.cn.bing.net/th/id/OIP.s_SXVVhK1MZhrGXQjWdOUAHaFm?w=212&h=160&c=7&o=5&dpr=2&pid=1.7'
];
class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: (Colors.white30),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) => _Item(index: index),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final int index;
   _Item({
    Key key,
    @required this.index, 
    }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => WebView(url: 'https://www.baidu.com')
        ));
      },
      child: Card(
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(pic[index]),
              Container(
                padding: EdgeInsets.all(4),
                child: Text('童话里都是骗人的！'),
              )
            ],
          )
        )
      )
    );
  }
}