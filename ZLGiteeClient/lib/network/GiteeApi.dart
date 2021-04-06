import 'dart:convert';

import 'package:ZLGiteeClient/model/GiteeIssue.dart';
import 'package:ZLGiteeClient/model/GiteeRepo.dart';
import 'package:http/http.dart' as http;
import 'package:ZLGiteeClient/network/GiteeClient.dart';
import 'package:ZLGiteeClient/model/GiteeUser.dart';

import 'GiteeRepoContent.dart';

enum GiteeApiEnum {
  UserInfo,
  RepoInfo,
  RepoReadMe,
  SearchRepo,
  SearchUser,
  SearchIssue
}

class GiteeApi extends Object {
  static Uri giteeUriFor(List<String> pathSegments,
      {Map<String, dynamic> params}) {
    List<String> realPathSegements = ["api", "v5"];
    realPathSegements.addAll(pathSegments);

    return Uri(
        scheme: "https",
        host: "gitee.com",
        pathSegments: realPathSegements,
        queryParameters: params);
  }

  static http.Request requestForApi(GiteeApiEnum api,
      [Map<String, dynamic> params]) {
    switch (api) {
      case GiteeApiEnum.UserInfo:
        {
          var login = params["login"];
          // https://gitee.com/repos/$login/$name
          var uri = giteeUriFor(["users", login]);
          return http.Request("GET", uri);
        }
      case GiteeApiEnum.RepoInfo:
        {
          var login = params["login"];
          var name = params["name"];
          // https://gitee.com/repos/$login/$name
          var uri = giteeUriFor(["repos", login, name]);
          return http.Request("GET", uri);
        }
      case GiteeApiEnum.RepoReadMe:
        {
          var login = params["login"];
          var name = params["name"];
          // https://gitee.com/repos/$login/$name/readme
          var uri = giteeUriFor(["repos", login, name, "readme"]);
          return http.Request("GET", uri);
        }
      case GiteeApiEnum.SearchRepo:
        {
          var uri = giteeUriFor(["search", "repositories"], params: params);
          return http.Request("GET", uri);
        }
      case GiteeApiEnum.SearchUser:
        {
          var uri = giteeUriFor(["search", "users"], params: params);
          return http.Request("GET", uri);
        }
      case GiteeApiEnum.SearchIssue:
        {
          var uri = giteeUriFor(["search", "issues"], params: params);
          return http.Request("GET", uri);
        }
    }
  }

  static void dealWithResponse(
      GiteeApiEnum api, http.Response response, GiteeResponse responseBlock) {
    bool result;
    dynamic data = response.body;
    var errorMessage;
    var statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300) {
      result = false;
      errorMessage = "[$statusCode] ${response.reasonPhrase}";
      responseBlock(result, data, errorMessage);
      return;
    }

    var bodyStr = Encoding.getByName("utf-8")?.decode(response.bodyBytes);
    if (bodyStr == null) {
      result = false;
      responseBlock(result, data, "decode error");
    }
    result = true;

    switch (api) {
      case GiteeApiEnum.UserInfo:
        {
          var map = JsonDecoder().convert(bodyStr);
          data = GiteeUser.fromJson(map);
        }
        break;
      case GiteeApiEnum.RepoInfo:
        {
          var map = JsonDecoder().convert(bodyStr);
          data = GiteeRepo.fromJson(map);
        }
        break;
      case GiteeApiEnum.RepoReadMe:
        {
          var map = JsonDecoder().convert(bodyStr);
          GiteeRepoContent content = GiteeRepoContent.fromJson(map);
          if (content.encoding == "base64") {
            List<int> bytes = base64Decode(content.content);
            content.content = Encoding.getByName("utf-8")?.decode(bytes);
          }
          data = content;
        }
        break;
      case GiteeApiEnum.SearchRepo:
        {
          var array = JsonDecoder().convert(bodyStr);
          var repoArray = <GiteeRepo>[];
          for (var item in array) {
            repoArray.add(GiteeRepo.fromJson(item));
          }
          data = repoArray;
        }
        break;
      case GiteeApiEnum.SearchRepo:
        {
          var array = JsonDecoder().convert(bodyStr);
          var repoArray = <GiteeRepo>[];
          for (var item in array) {
            repoArray.add(GiteeRepo.fromJson(item));
          }
          data = repoArray;
        }
        break;
      case GiteeApiEnum.SearchRepo:
        {
          var array = JsonDecoder().convert(bodyStr);
          var repoArray = <GiteeRepo>[];
          for (var item in array) {
            repoArray.add(GiteeRepo.fromJson(item));
          }
          data = repoArray;
        }
        break;
      case GiteeApiEnum.SearchUser:
        {
          var array = JsonDecoder().convert(bodyStr);
          var userArray = <GiteeUser>[];
          for (var item in array) {
            userArray.add(GiteeUser.fromJson(item));
          }
          data = userArray;
        }
        break;
      case GiteeApiEnum.SearchIssue:
        {
          var array = JsonDecoder().convert(bodyStr);
          var issueArray = <GiteeIssue>[];
          for (var item in array) {
            issueArray.add(GiteeIssue.fromJson(item));
          }
          data = issueArray;
        }
    }

    responseBlock(result, data, errorMessage);
  }
}
