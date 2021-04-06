import 'package:ZLGiteeClient/model/GiteeRepo.dart';
import 'package:ZLGiteeClient/network/GiteeApi.dart';
import 'package:ZLGiteeClient/network/GiteeClient.dart';
import 'package:ZLGiteeClient/network/GiteeRepoContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as MD;

class RepoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RepoPageState();
}

class RepoPageState extends State<RepoPage> {
  GiteeRepo repoInfo = GiteeRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repoInfo.fullName ?? "Repo")),
      body: ListView(
        children: [
          RepoHeaderView(repoInfo),
          RepoItemView(repoInfo),
          RepoReadMeView()
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  void _loadData() {
    GiteeClient.sharedClient.sendRequest(GiteeApiEnum.RepoInfo,
        params: {"login": "existorlive", "name": "GithubClient"},
        responseBlock: (result, data, errorMessage) {
      if (result) {
        if (data is GiteeRepo) {
          setState(() {
            repoInfo = data;
          });
        }
      } else {
        print(errorMessage);
      }
    });
  }
}

class RepoHeaderView extends StatelessWidget {
  GiteeRepo repoInfo;

  RepoHeaderView(this.repoInfo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Theme.of(context).backgroundColor,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(child: () {
            if (repoInfo?.owner?.avatarUrl != null) {
              return FadeInImage.assetNetwork(
                  placeholder: "assets/images/default_avatar.png",
                  fit: BoxFit.contain,
                  image: repoInfo.owner?.avatarUrl ?? "",
                  width: 50);
            } else {
              return Image.asset("assets/images/default_avatar.png", width: 50);
            }
          }()),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                repoInfo.fullName ?? "Repo",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "更新于${repoInfo.updatedAt?.toString() ?? ""}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(repoInfo.description ?? "",
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 14,
                      ))),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ItemButton(repoInfo.openIssuesCount ?? 0, "问题"),
                _ItemButton(repoInfo.stargazersCount ?? 0, "标星"),
                _ItemButton(repoInfo.forksCount ?? 0, "拷贝"),
                _ItemButton(repoInfo.watchersCount ?? 0, "关注")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RepoItemView extends StatelessWidget {
  GiteeRepo repoInfo;

  RepoItemView(this.repoInfo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Theme.of(context).backgroundColor,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        children: [
          _itemRow("提交", ""),
          _itemRow("分支", repoInfo.defaultBranch ?? ""),
          _itemRow("语言", repoInfo.language ?? ""),
          _itemRow("代码", ""),
          _itemRow("合并请求", ""),
        ],
      ),
    );
  }
}

class RepoReadMeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RepoReadMeViewState("existorlive", "GithubClient");
  }
}

class _RepoReadMeViewState extends State<RepoReadMeView> {
  String login;
  String name;

  GiteeRepoContent _content;

  _RepoReadMeViewState(this.login, this.name);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  void _loadData() {
    GiteeClient.sharedClient.sendRequest(GiteeApiEnum.RepoReadMe,
        params: {"login": "existorlive", "name": "GithubClient"},
        responseBlock: (result, data, errorMessage) {
      if (result) {
        if (data is GiteeRepoContent) {
          setState(() {
            _content = data;
          });
        }
      } else {
        print(errorMessage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "ReadMe",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          MarkdownBody(data: _content?.content ?? "")
        ],
      ),
    );
    // TODO: implement build
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
