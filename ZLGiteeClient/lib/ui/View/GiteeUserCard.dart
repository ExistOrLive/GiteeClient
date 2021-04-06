import 'package:ZLGiteeClient/model/GiteeUser.dart';
import 'package:ZLGiteeClient/ui/View/GiteeAvaterButton.dart';
import 'package:flutter/material.dart';

class GiteeUserCard extends StatelessWidget {
  final GiteeUser _userInfo;

  GiteeUserCard(this._userInfo);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: GiteeAvatarButton(_userInfo.avatarUrl, width: 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${_userInfo.login}",
                      style: Theme.of(context).textTheme.subtitle1),
                  Text("${_userInfo.bio}",
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              )
            ])));
  }
}
