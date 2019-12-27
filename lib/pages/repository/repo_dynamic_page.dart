import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_github/pages/dynamic/widget/dynamic_item.dart';
import 'package:flutter_github/pages/repository/bloc/repository_bloc.dart';
import 'package:flutter_github/pages/repository/widget/rep_dynamic_head_card.dart';
import 'package:flutter_github/pages/repository/widget/rep_detail_select_bar.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/flutter_sliver_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_github/pages/repository/bloc/repository_entry_bloc.dart';

class RepositoryDynamicPageWidget extends StatefulWidget {
  @override
  _RepositoryDynamicPageWidgetState createState() =>
      _RepositoryDynamicPageWidgetState();
}

class _RepositoryDynamicPageWidgetState
    extends State<RepositoryDynamicPageWidget> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    RepositoryBloc repositoryDynamicBloc = Provider.of<RepositoryEntryBloc>(context).repositoryDynamicBloc;
    return EasyRefresh.custom(
      firstRefresh: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: RepositionDynamicHeadCardWidget(),
        ),
        // 动态/提交 选项切换
        FlutterSliverAppbarWidget(
          pinned: true,
          minHeight: 45,
          maxHeight: 45,
          builder: (BuildContext context, double shrinkOffset, bool overlapsContent){
            return RepositionDetailSelectWidget(shrinkOffset);
          },
        ),
        StreamBuilder<List<EventViewModel>>(
          stream: Provider.of<RepositoryEntryBloc>(context).repositoryDynamicBloc.repoCommitsObservable,
          builder: (BuildContext context, AsyncSnapshot<List<EventViewModel>> snapshot){
          if(snapshot.data != null && snapshot.data.length > 0){
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return DynamicItemWidget(snapshot.data[index]);
                },
                childCount: snapshot.data.length,
              ),
            );
          }
          return SliverToBoxAdapter(
              child: Text("数据为空好了"),
          );
        },
        ),
      ],
      onRefresh: () async {
        repositoryDynamicBloc.clearRepositoryCommits();
        await repositoryDynamicBloc.getRepositoryDetail();
        await repositoryDynamicBloc.getRepositoryCommits();
      },
      onLoad: () async{
        await repositoryDynamicBloc.getRepositoryCommits();
      },
    );
  }
}
