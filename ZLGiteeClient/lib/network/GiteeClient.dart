import 'package:ZLGiteeClient/network/GiteeApi.dart';
import 'package:http/http.dart' as http;

typedef void GiteeResponse(bool result, dynamic data, String errorMessage);

class GiteeClient extends Object {
  String token = "";
  final http.Client client;

  GiteeClient() : client = http.Client();

  static final GiteeClient sharedClient = GiteeClient();

  void sendRequest(GiteeApiEnum api,
      {Map<String, dynamic> params, GiteeResponse responseBlock}) async {
    var request = GiteeApi.requestForApi(api, params);
    http.Response uriResponse =
        await http.Response.fromStream(await client.send(request));
    GiteeApi.dealWithResponse(api, uriResponse, responseBlock);
  }

  void close() {
    token = "";
    client?.close();
  }
}
