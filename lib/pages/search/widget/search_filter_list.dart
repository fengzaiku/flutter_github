import 'package:flutter/material.dart';
import 'package:flutter_github/utils/widget_standard.dart';

typedef void SearchSelectItemChange<String>(String value);

class SearchFilterListWidget extends StatefulWidget {
  final SearchSelectItemChange<String> sortCallback;
  final SearchSelectItemChange<String> typeCallback;
  final SearchSelectItemChange<String> languageCallback;

  SearchFilterListWidget(
      {Key key, this.sortCallback, this.typeCallback, this.languageCallback})
      : super(key: key);

  @override
  _SearchFilterListWidgetState createState() => _SearchFilterListWidgetState();
}

class _SearchFilterListWidgetState extends State<SearchFilterListWidget> {
  final double itemWidth = 200.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: _renderList(),
          ),
        ),
      ),
    );
  }

  List<Widget> _renderList() {
    List<Widget> list = List();

//    类型
    list.add(_renderListTitle("类型"));
    list.addAll(searchFilterType
        .map((item) =>
            _renderListItem(item, searchFilterType, widget.typeCallback))
        .toList());

//    排序
    list.add(_renderListTitle("排序"));
    list.addAll(sortType
        .map((item) => _renderListItem(item, sortType, widget.sortCallback))
        .toList());

//    语言
    list.add(_renderListTitle("语言"));
    list.addAll(searchLanguageType
        .map((item) =>
            _renderListItem(item, searchLanguageType, widget.languageCallback))
        .toList());
    return list;
  }

  Widget _renderListTitle(String title) {
    return Container(
      width: itemWidth,
      color: Theme.of(context).primaryColor,
//      margin: EdgeInsets.only(left: 50, right: 50),
      height: 40,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget _renderListItem(SearchFilterModel model, List<SearchFilterModel> list,
      SearchSelectItemChange select) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: itemWidth - 20,
        decoration: BoxDecoration(
          border: Border(
            bottom: Divider.createBorderSide(context, color: Colors.grey),
          ),
        ),
        child: CheckboxListTile(
            title: Text(model.name),
            value: model.select,
            onChanged: (bool value) {
              setState(() {
                list.forEach((item) {
                  item.select = false;
                });
                model.select = true;
              });
              select?.call(model.value);
            },
            controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );
  }
}

List<SearchFilterModel> sortType = [
  SearchFilterModel(name: 'desc', value: 'desc', select: true),
  SearchFilterModel(name: 'asc', value: 'asc', select: false),
];
List<SearchFilterModel> searchFilterType = [
  SearchFilterModel(name: "best_match", value: 'best%20match', select: true),
  SearchFilterModel(name: "stars", value: 'stars', select: false),
  SearchFilterModel(name: "forks", value: 'forks', select: false),
  SearchFilterModel(name: "updated", value: 'updated', select: false),
];
List<SearchFilterModel> searchLanguageType = [
  SearchFilterModel(name: "trendAll", value: null, select: true),
  SearchFilterModel(name: "Java", value: 'Java', select: false),
  SearchFilterModel(name: "Dart", value: 'Dart', select: false),
  SearchFilterModel(name: "Objective_C", value: 'Objective-C', select: false),
  SearchFilterModel(name: "Swift", value: 'Swift', select: false),
  SearchFilterModel(name: "JavaScript", value: 'JavaScript', select: false),
  SearchFilterModel(name: "PHP", value: 'PHP', select: false),
  SearchFilterModel(name: "C__", value: 'C++', select: false),
  SearchFilterModel(name: "C", value: 'C', select: false),
  SearchFilterModel(name: "HTML", value: 'HTML', select: false),
  SearchFilterModel(name: "CSS", value: 'CSS', select: false),
];
