import 'dart:math';

import 'package:ZLGiteeClient/network/GiteeApi.dart';
import 'package:ZLGiteeClient/network/GiteeClient.dart';
import 'package:ZLGiteeClient/ui/View/GiteeItemListView.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchUserPage extends StatefulWidget {
  final String searchKey;

  SearchUserPage(this.searchKey);

  @override
  State<StatefulWidget> createState() => _SearchUserPageState(searchKey);
}

class _SearchUserPageState extends State<SearchUserPage> {
  final String searchKey;

  _SearchUserPageState(this.searchKey);

  int pageNum = 1;
  List<Object> _itemList = [];
  RefreshController _controller = RefreshController(initialRefresh: false);

  void _onRefresh() {
    GiteeClient.sharedClient.sendRequest(GiteeApiEnum.SearchUser,
        params: {"q": searchKey, "page": "1", "per_page": "15"},
        responseBlock: (result, data, error) {
      if (result) {
        setState(() {
          _itemList = data;
        });
        pageNum = 1;
        _controller.refreshCompleted();
      } else {
        _controller.refreshFailed();
      }
    });
  }

  void _onLoading() {
    GiteeClient.sharedClient.sendRequest(GiteeApiEnum.SearchUser,
        params: {"q": searchKey, "page": "$pageNum", "per_page": "15"},
        responseBlock: (result, data, error) {
      if (result) {
        setState(() {
          _itemList.addAll(data);
        });
        if (data?.length ?? 0 > 0) {
          pageNum++;
          _controller.loadComplete();
        } else {
          _controller.loadNoData();
        }
      } else {
        _controller.loadFailed();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (searchKey != null && searchKey.isNotEmpty) {
      _onRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),
        footer: ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        controller: _controller,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: GiteeItemListView(_itemList));
  }
}
