import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ZLGiteeClient/network/GiteeClient.dart';
import 'package:ZLGiteeClient/Model/GiteeUser.Dart';

enum GiteeApiEnum {
  UserInfo,
  RepoInfo,
}

class GiteeApi extends Object {
  static const baseUri = "https://gitee.com/api/v5/";

  static Uri UriForApi(GiteeApiEnum api, [Map<String, dynamic> params]) {
    switch (api) {
      case GiteeApiEnum.UserInfo:
        return Uri.parse("$baseUri/users/${params["login"]}");
      case GiteeApiEnum.RepoInfo:
        return Uri.parse("$baseUri/repos/${params["login"]}/${params["name"]}");
    }
  }

  static http.Request requestForApi(GiteeApiEnum api,
      [Map<String, dynamic> params]) {
    switch (api) {
      case GiteeApiEnum.UserInfo:
        {
          var uri = Uri.parse("$baseUri/users/${params["login"]}");
          return http.Request("GET", uri);
        }
      case GiteeApiEnum.RepoInfo:
        {
          var uri =
              Uri.parse("$baseUri/repos/${params["login"]}/${params["name"]}");
          return http.Request("GET", uri);
        }
    }
  }

  static void dealWithResponse(
      GiteeApiEnum api, http.Response response, GiteeResponse responseBlock) {
    bool result;
    var data;
    var errorMessage;
    var statusCode = response.statusCode;

    if (statusCode < 200 && statusCode >= 300) {
      result = false;
      errorMessage = "[$statusCode] ${response.reasonPhrase}";
      responseBlock(result, data, errorMessage);
      return;
    }

    result = true;

    switch (api) {
      case GiteeApiEnum.UserInfo:
        {
          var map = JsonDecoder().convert(response.body);
          data = GiteeUser.fromJson(map);
        }
        break;
      case GiteeApiEnum.RepoInfo:
        {
          data = response.body;
        }
        break;
    }
    responseBlock(result, data, errorMessage);
  }
}