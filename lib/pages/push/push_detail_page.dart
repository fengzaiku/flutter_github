import 'package:flutter/material.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/CommitFile.dart';
import 'package:flutter_github/model/PushCommit.dart';
import 'package:flutter_github/pages/push/widget/push_code_header.dart';
import 'package:flutter_github/pages/push/widget/push_code_item.dart';
import 'package:flutter_github/router/page_router.dart';
import 'package:flutter_github/utils/widget_standard.dart';

class PushDetailPageWidget extends StatefulWidget {
  final String reposOwner;
  final String reposName;
  final String sha;

  PushDetailPageWidget(this.reposOwner, this.reposName, this.sha, {Key key})
      : super(key: key);

  @override
  _PushDetailPageWidgetState createState() => _PushDetailPageWidgetState();
}

class _PushDetailPageWidgetState extends State<PushDetailPageWidget> {
  PushHeaderViewModel pushHeaderViewModel = new PushHeaderViewModel();
  PushCommit pushCommit;
  List<CommitFile> pushCommitFiles = List();

  Future _onRefresh() async {
    var result = await http.get(Api.getReposCommitsInfo(
        widget.reposOwner, widget.reposName, widget.sha));
    pushCommitFiles.clear();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("push 详情页"),
      ),
      body: FutureBuilder(
          future: _onRefresh(),
//          initialData: ,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState != ConnectionState.done){
              return Center(
                child: Text("客观别急，我在加载数据..."),
              );
            }

            if(snapshot.data == null){
              return Center(
                child: Text("哎啊！数据不存在的啦"),
              );
            }

            pushCommit = PushCommit.fromJson(snapshot.data);
            pushCommitFiles.addAll(pushCommit.files);
            pushHeaderViewModel = PushHeaderViewModel.forMap(pushCommit);

            return Column(
              children: <Widget>[
                PushCodeHeaderWidget(pushHeaderViewModel),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      PushCodeItemViewModel itemViewModel = PushCodeItemViewModel.fromMap(pushCommitFiles[index]);
                      return PushCodeItemWidget(itemViewModel, onPressd: (){
                        PageRouter.goToRepositionReadmePage(context, html: itemViewModel.patch, title: itemViewModel.name);
                      },);
                    },
                    itemCount: pushCommitFiles.length,
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
