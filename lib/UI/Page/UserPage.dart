import 'package:ZLGiteeClient/network/GiteeApi.dart';
import 'package:ZLGiteeClient/network/GiteeClient.dart';
import 'package:ZLGiteeClient/model/GiteeUser.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  State createState() {
    return _UserPageState();
  }
}

class _UserPageState extends State<UserPage> {
  GiteeUser userInfo = GiteeUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(userInfo?.login ?? ""),
          foregroundColor: Colors.red),
      body: ListView(
        children: [UserHeaderWidget(userInfo), UserItemWidget(userInfo)],
      ),
    );

    // Column is a vertical, linear layout.
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  void _loadData() {
    GiteeClient.sharedClient
        .sendRequest(GiteeApiEnum.UserInfo, {"login": "existorlive"},
            (result, data, errorMessage) {
      if (result) {
        if (data is GiteeUser) {
          setState(() {
            userInfo = data;
          });
        }
      } else {
        print(errorMessage);
      }
    });
  }
}

// ignore: non_constant_identifier_names
class UserHeaderWidget extends StatelessWidget {
  GiteeUser userInfo;

  UserHeaderWidget(this.userInfo);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      height: 200,
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipOval(
              child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/default_avatar.png",
                  fit: BoxFit.contain,
                  image: userInfo?.avatarUrl ?? "",
                  width: 50)),
          Text(
            "${userInfo?.login ?? ""}(${userInfo?.name ?? ""})",
            style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 20),
          ),
          Text(
            "创建于${userInfo?.createdAt?.toLocal() ?? ""}",
            textDirection: TextDirection.ltr,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Row(
            children: [
              _ItemButton(userInfo?.publicRepos ?? 0, "仓库"),
              _ItemButton(userInfo?.publicGists ?? 0, "代码片段"),
              _ItemButton(userInfo?.followers ?? 0, "粉丝"),
              _ItemButton(userInfo?.following ?? 0, "关注")
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          )
        ],
      ),
    );
  }
}

class UserItemWidget extends StatelessWidget {
  GiteeUser userInfo;

  UserItemWidget(this.userInfo);

  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _itemRow("公司", userInfo?.company ?? ""),
          _itemRow("职业", userInfo?.profession ?? ""),
          _itemRow("邮箱", userInfo?.email ?? ""),
          _itemRow("博客", userInfo?.company ?? ""),
          _itemRow("微信", userInfo?.wechat ?? ""),
          _itemRow("qq", userInfo?.qq ?? ""),
          _itemRow("微博", userInfo?.weibo ?? ""),
          _itemRow("领英", userInfo?.linkedin ?? ""),
        ],
      ),
    );
  }
}

class _ItemButton extends StatelessWidget {
  final int number;
  final String title;
  final GestureTapCallback callback;

  _ItemButton(this.number, this.title, {this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text("$number",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 12)),
              ),
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 12))
            ],
          ),
        ),
        onTap: callback);
  }
}

class _itemRow extends StatelessWidget {
  final String title;
  final String subConent;
  final GestureTapCallback callback;
  _itemRow(this.title, [this.subConent, this.callback]);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
      color: Theme.of(context).backgroundColor,
      child: Row(
        children: [
          Text(title,
              style:
                  Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 14)),
          Expanded(child: Container()),
          Container(
            child: Text(subConent ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 14)),
            margin: EdgeInsets.only(left: 25),
          ),
          Icon(
            Icons.navigate_next,
            color: Theme.of(context).textTheme.bodyText1.color,
            size: 20,
          ),
        ],
      ),
    );
  }
}
