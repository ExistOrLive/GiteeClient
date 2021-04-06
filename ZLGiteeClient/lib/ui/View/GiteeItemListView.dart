import 'package:ZLGiteeClient/model/GiteeRepo.dart';
import 'package:ZLGiteeClient/model/GiteeUser.dart';
import 'package:ZLGiteeClient/ui/View/GiteeRepoCard.dart';
import 'package:ZLGiteeClient/ui/View/GiteeUserCard.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef void GiteeItemListViewCallBack();

class GiteeItemListView extends StatelessWidget {
  final List<Object> _itemList;
  GiteeItemListView(this._itemList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = _itemList[index];
        if (item is GiteeUser) {
          return GiteeUserCard(item);
        } else if (item is GiteeRepo) {
          return GiteeRepoCard(item);
        }
        return ListTile();
      },
      itemCount: _itemList.length,
    );
  }
}
