import 'package:flutter/material.dart';
class SearchFilterListWidget extends StatefulWidget {
  @override
  _SearchFilterListWidgetState createState() => _SearchFilterListWidgetState();
}

class _SearchFilterListWidgetState extends State<SearchFilterListWidget> {
  final double itemWidth = 300.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
//        width: itemWidth,
//        padding: EdgeInsets.only(),
        child: SingleChildScrollView(
          child: Column(
            children: _renderList(),
          ),
        ),
      ),
    );
  }

  List<Widget> _renderList(){
    List<Widget> list = List();

//    类型
    list.add(_renderListTitle("类型"));


    return list;
  }

  Widget _renderListTitle(String title){
    return Container(
      width: itemWidth,
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.only(left: 50, right: 50),
      height: 50,
      child: Center(
        child: Text(
            title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
