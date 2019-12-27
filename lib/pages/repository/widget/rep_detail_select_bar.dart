import 'package:flutter/material.dart';
import 'package:flutter_github/pages/repository/bloc/repository_bloc.dart';
import 'package:flutter_github/pages/repository/bloc/repository_entry_bloc.dart';
import 'package:flutter_github/widget/row_select_divider_list.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:provider/provider.dart';
import 'package:flutter_github/pages/repository/bloc/repository_entry_bloc.dart';

class RepositionDetailSelectWidget extends StatelessWidget {
  final double shrinkOffset;

  RepositionDetailSelectWidget(
    this.shrinkOffset, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepositoryBloc repositoryDynamicBloc = Provider.of<RepositoryEntryBloc>(context).repositoryDynamicBloc;
    return StreamBuilder<String>(
      stream: repositoryDynamicBloc.selectTabObservable,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return RowSelectDividerListWidget(
          ratio: (45 - shrinkOffset) / 45,
          items: [
            RowSelectItem(selectKey: 'dynamic', selectValue: "动态"),
            RowSelectItem(selectKey: 'push', selectValue: "提交"),
          ],
          builder: (RowSelectItem item, int index) {
            return Expanded(
              child: FlatButton(
                onPressed: () {
                  repositoryDynamicBloc.updateSelectTab(item.selectKey);
                },
                child: Center(
                  child: Text(
                    item.selectValue,
                    style: TextStyle(
                        color: snapshot.data == item.selectKey
                            ? Colors.white
                            : Colors.grey),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
