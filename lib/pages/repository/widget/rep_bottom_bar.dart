import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/repository/provider/action_provider.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:provider/provider.dart';
import 'package:flutter_github/utils/widget_standard.dart';

class RepositoryDetailBottomAppBar extends StatefulWidget {
  @override
  _RepositoryDetailBottomAppBarState createState() => _RepositoryDetailBottomAppBarState();
}

class _RepositoryDetailBottomAppBarState extends State<RepositoryDetailBottomAppBar> {
  ActionProvider _actionProvider;

  @override
  void didChangeDependencies() {
    print("didChangeDependencies-----------------------------");
    super.didChangeDependencies();
    _actionProvider = Provider.of<ActionProvider>(context, listen: false);
    _actionProvider.getRepositoryStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Consumer<ActionProvider>(
        builder: (BuildContext context,ActionProvider store,Widget forkWidget){
          BottomStatusModel bottomViewModel = BottomStatusModel.fromJson(store.actionStatus);
          return Container(
            height: 50,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
//                star
                IconTextWidget(
                  icon: bottomViewModel.starIcon,
                  iconSize: 18,
                  iconSpace: 10,
                  text: bottomViewModel.starText,
                ),
                SizedBox(
                  width: 20,
                ),
//                watch
                IconTextWidget(
                  icon: bottomViewModel.watchIcon,
                  iconSize: 18,
                  iconSpace: 10,
                  text: bottomViewModel.watchText,
                ),
                SizedBox(
                  width: 20,
                ),
                forkWidget,
              ],
            ),
          );
        },
        child: GestureDetector(
          child: IconTextWidget(
            icon: FgIcons.dynamic,
            iconSize: 18,
            iconSpace: 10,
            text: "Fork",
          ),
          onTap: (){
//                    Provider.of<RepositoryEntryBloc>(context).repositoryDynamicBloc.updateRepositoryFork();
          },
        ),
      ),
    );
  }
}
