import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';

class SearchInputWidget extends StatefulWidget {
  final ValueChanged onChanged;
  final ValueChanged onSubmitted;
  final ValueChanged onSearch;
  final bool         autofocus;
  final TextEditingController controller;

  SearchInputWidget({
    Key key,
    this.onChanged,
    this.onSubmitted,
    this.onSearch,
    this.controller,
    this.autofocus = false
  }) : super(key:key);

  @override
  _SearchInputWidgetState createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(0)),
        border: Border.all(
          color: Colors.black26,
          width: 0.3
        )
      ),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              autofocus: widget.autofocus,
              controller:widget.controller,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              decoration: InputDecoration.collapsed(
                  hintText: "搜索"
              ),
            ),
          ),
          RawMaterialButton(
            constraints: BoxConstraints(minHeight: 0,minWidth: 0),
            child: Icon(FgIcons.search),
            onPressed: (){
              widget.onSearch?.call(widget.controller.value);
            },
          )
        ],
      ),
    );
  }
}
