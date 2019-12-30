import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/pages/code/code_detail.dart';
import 'package:flutter_github/pages/repository/bloc/repository_entry_bloc.dart';
import 'package:flutter_github/pages/repository/provider/action_provider.dart';
import 'package:flutter_github/pages/repository/provider/files_provider.dart';
import 'package:flutter_github/pages/repository/rep_readme_page.dart';
import 'package:flutter_github/pages/repository/repo_dynamic_page.dart';
import 'package:flutter_github/pages/repository/repo_file_page.dart';
import 'package:flutter_github/pages/repository/repo_issue_page.dart';
import 'package:flutter_github/pages/repository/widget/rep_bottom_bar.dart';
import 'package:flutter_github/router/page_router.dart';
import 'package:flutter_github/widget/tabar_widget.dart';
import 'package:provider/provider.dart';


class RepositionDetailPageWidget extends StatelessWidget {
  final RepositionViewModel repositionViewModel;

  RepositionDetailPageWidget(this.repositionViewModel,{Key key}):super(key:key);

  final List _tabs = ["动态", "详情", "ISSUE", "文件"];

  Future<String> getReadmeFile(context) async {
    String result = await http.get(Api.readmeFile(repositionViewModel.ownerName+"/"+repositionViewModel.repositoryName, null),options: Options(
        headers: {"Accept": 'application/vnd.github.html'},
        contentType: "text"
//      contentType: "text/plain; charset=utf-8",
//      headers: {"Accept": 'application/vnd.github.VERSION.raw'}
    ));
    PageRouter.goToCodeDetailDetailPage(context, repositionViewModel.repositoryName +"/README.md", result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RepositoryEntryBloc>(
          create:  (_) => RepositoryEntryBloc(repositionViewModel),
          dispose: (context, value) => value.dispose(),
        ),
        ChangeNotifierProvider<ActionProvider>(
          create: (_) => ActionProvider(repositionViewModel),
        ),
        ChangeNotifierProvider<FilesProvider>(
          create: (_) => FilesProvider(),
        ),
      ],
      child: TabarPageWidget(
        tabItems: _tabs.map((name) => Tab(text: name)).toList(),
        onTap: (int index){
          if(index == 1){
            getReadmeFile(context);
          }
//          return false;
        },
        floatingActionButton: FloatingActionButton(
          child: Text("关注"),
          onPressed: () {
            print("迪纳基");
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: RepositoryDetailBottomAppBar(),
        tabViews: <Widget>[
          RepositoryDynamicPageWidget(),
//          SizedBox(),
//          FutureBuilder(
//            future: getReadmeFile(getReadmeFile),
//            builder: (BuildContext context, AsyncSnapshot<String> snapshot){
//              if(snapshot.hasData){
//                return CodeDetailPageWidget(
//                    title: repositionViewModel.repositoryName,
//                    htmlBody: snapshot.data,
//                );
//              }
//              return Text("哎啊！数据在哪里...");
//            },
//          ),
//          RepositionReadmePageWidget(
//            onRefresh: getReadmeFile
//          ),
          RepositionIssuePageWidget(repositionViewModel),
          RepositionFileListWidget(
              repositionViewModel.ownerName,
              repositionViewModel.repositoryName
          ),
        ],
      ),
    );
  }
}
