class GiteeUser extends Object {
  int id;
  String login;
  String name;
  String avatarUrl;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  String blog;
  String weibo;
  String bio;
  int publicRepos;
  int publicGists;
  int followers;
  int following;
  int stared;
  int watched;
  DateTime createdAt;
  DateTime updatedAt;
  String company;
  String profession;
  String wechat;
  String qq;
  String linkedin;
  String email;

  GiteeUser(
      {this.id,
      this.login,
      this.name,
      this.avatarUrl,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.blog,
      this.weibo,
      this.bio,
      this.publicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.stared,
      this.watched,
      this.createdAt,
      this.updatedAt,
      this.company,
      this.profession,
      this.wechat,
      this.qq,
      this.linkedin,
      this.email});

  GiteeUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    name = json['name'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    blog = json['blog'];
    weibo = json['weibo'];
    bio = json['bio'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
    stared = json['stared'];
    watched = json['watched'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    company = json['company'];
    profession = json['profession'];
    wechat = json['wechat'];
    qq = json['qq'];
    linkedin = json['linkedin'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['name'] = this.name;
    data['avatar_url'] = this.avatarUrl;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['blog'] = this.blog;
    data['weibo'] = this.weibo;
    data['bio'] = this.bio;
    data['public_repos'] = this.publicRepos;
    data['public_gists'] = this.publicGists;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['stared'] = this.stared;
    data['watched'] = this.watched;
    data['created_at'] = this.createdAt.toIso8601String();
    data['updated_at'] = this.updatedAt.toIso8601String();
    data['company'] = this.company;
    data['profession'] = this.profession;
    data['wechat'] = this.wechat;
    data['qq'] = this.qq;
    data['linkedin'] = this.linkedin;
    data['email'] = this.email;
    return data;
  }
}
