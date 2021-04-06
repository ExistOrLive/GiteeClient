class GiteeRepoContent {
  String type;
  String encoding;
  int size;
  String name;
  String path;
  String content;
  String sha;
  String url;
  String htmlUrl;
  String downloadUrl;
  Links lLinks;

  GiteeRepoContent(
      {this.type,
      this.encoding,
      this.size,
      this.name,
      this.path,
      this.content,
      this.sha,
      this.url,
      this.htmlUrl,
      this.downloadUrl,
      this.lLinks});

  GiteeRepoContent.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    encoding = json['encoding'];
    size = json['size'];
    name = json['name'];
    path = json['path'];
    content = json['content'];
    sha = json['sha'];
    url = json['url'];
    htmlUrl = json['html_url'];
    downloadUrl = json['download_url'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['encoding'] = this.encoding;
    data['size'] = this.size;
    data['name'] = this.name;
    data['path'] = this.path;
    data['content'] = this.content;
    data['sha'] = this.sha;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['download_url'] = this.downloadUrl;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Links {
  String self;
  String html;

  Links({this.self, this.html});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    return data;
  }
}
