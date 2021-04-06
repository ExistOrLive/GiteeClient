import 'package:ZLGiteeClient/ui/Page/search/SearchRepoPage.dart';
import 'package:ZLGiteeClient/ui/Page/search/SearchUserPage.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> searchTabs = [Tab(text: "Repository"), Tab(text: "User")];
  TabController _tabController;
  TextEditingController _textEditController;

  String _searchKey = null;

  void initState() {
    super.initState();
    _tabController = TabController(length: searchTabs.length, vsync: this);
    _textEditController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    _textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: TextField(
              controller: _textEditController,
              decoration: InputDecoration(
                hintText: "Search",
              ),
              onSubmitted: (value) {
                if (value != null && value.isNotEmpty) {
                  setState(() {
                    _searchKey = value;
                  });
                }
              }),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: searchTabs,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [SearchRepoPage(_searchKey), SearchUserPage(_searchKey)]),
    );
  }
}
