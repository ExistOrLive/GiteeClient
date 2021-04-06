import 'package:ZLGiteeClient/model/GiteeRepo.dart';
import 'package:ZLGiteeClient/ui/View/GiteeAvaterButton.dart';
import 'package:flutter/material.dart';

class GiteeRepoCard extends StatelessWidget {
  final GiteeRepo _repoInfo;

  GiteeRepoCard(this._repoInfo);

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
                child: GiteeAvatarButton(
                  _repoInfo.owner.avatarUrl,
                  width: 50,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${_repoInfo.name}",
                      style: Theme.of(context).textTheme.subtitle1),
                  Text("${_repoInfo.owner.login}   ${_repoInfo.language}",
                      style: Theme.of(context).textTheme.bodyText2),
                  Text("${_repoInfo.description}",
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              )
            ])));
  }
}
