class GiteeRepo {
  int id;
  String fullName;
  String humanName;
  String url;
  Namespace namespace;
  String path;
  String name;
  SimpleGiteeUser owner;
  String description;
  bool private;
  bool public;
  bool internal;
  bool fork;
  String htmlUrl;
  String sshUrl;
  String forksUrl;
  String keysUrl;
  String collaboratorsUrl;
  String hooksUrl;
  String branchesUrl;
  String tagsUrl;
  String blobsUrl;
  String stargazersUrl;
  String contributorsUrl;
  String commitsUrl;
  String commentsUrl;
  String issueCommentUrl;
  String issuesUrl;
  String pullsUrl;
  String milestonesUrl;
  String notificationsUrl;
  String labelsUrl;
  String releasesUrl;
  bool recommend;
  String homepage;
  String language;
  int forksCount;
  int stargazersCount;
  int watchersCount;
  String defaultBranch;
  int openIssuesCount;
  bool hasIssues;
  bool hasWiki;
  bool issueComment;
  bool canComment;
  bool pullRequestsEnabled;
  bool hasPage;
  String license;
  bool outsourced;
  String projectCreator;
  List<String> members;
  DateTime pushedAt;
  DateTime createdAt;
  DateTime updatedAt;
  GiteeRepo parent;
  String paas;
  int assigneesNumber;
  int testersNumber;
  List<String> assignees;
  List<String> testers;

  GiteeRepo(
      {this.id,
      this.fullName,
      this.humanName,
      this.url,
      this.namespace,
      this.path,
      this.name,
      this.owner,
      this.description,
      this.private,
      this.public,
      this.internal,
      this.fork,
      this.htmlUrl,
      this.sshUrl,
      this.forksUrl,
      this.keysUrl,
      this.collaboratorsUrl,
      this.hooksUrl,
      this.branchesUrl,
      this.tagsUrl,
      this.blobsUrl,
      this.stargazersUrl,
      this.contributorsUrl,
      this.commitsUrl,
      this.commentsUrl,
      this.issueCommentUrl,
      this.issuesUrl,
      this.pullsUrl,
      this.milestonesUrl,
      this.notificationsUrl,
      this.labelsUrl,
      this.releasesUrl,
      this.recommend,
      this.homepage,
      this.language,
      this.forksCount,
      this.stargazersCount,
      this.watchersCount,
      this.defaultBranch,
      this.openIssuesCount,
      this.hasIssues,
      this.hasWiki,
      this.issueComment,
      this.canComment,
      this.pullRequestsEnabled,
      this.hasPage,
      this.license,
      this.outsourced,
      this.projectCreator,
      this.members,
      this.pushedAt,
      this.createdAt,
      this.updatedAt,
      this.parent,
      this.paas,
      this.assigneesNumber,
      this.testersNumber,
      this.assignees,
      this.testers});

  GiteeRepo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    humanName = json['human_name'];
    url = json['url'];
    namespace = json['namespace'] != null
        ? new Namespace.fromJson(json['namespace'])
        : null;
    path = json['path'];
    name = json['name'];
    owner = json['owner'] != null
        ? new SimpleGiteeUser.fromJson(json['owner'])
        : null;
    description = json['description'];
    private = json['private'];
    public = json['public'];
    internal = json['internal'];
    fork = json['fork'];
    htmlUrl = json['html_url'];
    sshUrl = json['ssh_url'];
    forksUrl = json['forks_url'];
    keysUrl = json['keys_url'];
    collaboratorsUrl = json['collaborators_url'];
    hooksUrl = json['hooks_url'];
    branchesUrl = json['branches_url'];
    tagsUrl = json['tags_url'];
    blobsUrl = json['blobs_url'];
    stargazersUrl = json['stargazers_url'];
    contributorsUrl = json['contributors_url'];
    commitsUrl = json['commits_url'];
    commentsUrl = json['comments_url'];
    issueCommentUrl = json['issue_comment_url'];
    issuesUrl = json['issues_url'];
    pullsUrl = json['pulls_url'];
    milestonesUrl = json['milestones_url'];
    notificationsUrl = json['notifications_url'];
    labelsUrl = json['labels_url'];
    releasesUrl = json['releases_url'];
    recommend = json['recommend'];
    homepage = json['homepage'];
    language = json['language'];
    forksCount = json['forks_count'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    defaultBranch = json['default_branch'];
    openIssuesCount = json['open_issues_count'];
    hasIssues = json['has_issues'];
    hasWiki = json['has_wiki'];
    issueComment = json['issue_comment'];
    canComment = json['can_comment'];
    pullRequestsEnabled = json['pull_requests_enabled'];
    hasPage = json['has_page'];
    license = json['license'];
    outsourced = json['outsourced'];
    projectCreator = json['project_creator'];
    members = json['members'].cast<String>();
    pushedAt = DateTime.parse(json['pushed_at']);
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    parent = json['parent'];
    paas = json['paas'];
    assigneesNumber = json['assignees_number'];
    testersNumber = json['testers_number'];
    assignees = json['assignees'].cast<String>();
    testers = json['testers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['human_name'] = this.humanName;
    data['url'] = this.url;
    if (this.namespace != null) {
      data['namespace'] = this.namespace.toJson();
    }
    data['path'] = this.path;
    data['name'] = this.name;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['description'] = this.description;
    data['private'] = this.private;
    data['public'] = this.public;
    data['internal'] = this.internal;
    data['fork'] = this.fork;
    data['html_url'] = this.htmlUrl;
    data['ssh_url'] = this.sshUrl;
    data['forks_url'] = this.forksUrl;
    data['keys_url'] = this.keysUrl;
    data['collaborators_url'] = this.collaboratorsUrl;
    data['hooks_url'] = this.hooksUrl;
    data['branches_url'] = this.branchesUrl;
    data['tags_url'] = this.tagsUrl;
    data['blobs_url'] = this.blobsUrl;
    data['stargazers_url'] = this.stargazersUrl;
    data['contributors_url'] = this.contributorsUrl;
    data['commits_url'] = this.commitsUrl;
    data['comments_url'] = this.commentsUrl;
    data['issue_comment_url'] = this.issueCommentUrl;
    data['issues_url'] = this.issuesUrl;
    data['pulls_url'] = this.pullsUrl;
    data['milestones_url'] = this.milestonesUrl;
    data['notifications_url'] = this.notificationsUrl;
    data['labels_url'] = this.labelsUrl;
    data['releases_url'] = this.releasesUrl;
    data['recommend'] = this.recommend;
    data['homepage'] = this.homepage;
    data['language'] = this.language;
    data['forks_count'] = this.forksCount;
    data['stargazers_count'] = this.stargazersCount;
    data['watchers_count'] = this.watchersCount;
    data['default_branch'] = this.defaultBranch;
    data['open_issues_count'] = this.openIssuesCount;
    data['has_issues'] = this.hasIssues;
    data['has_wiki'] = this.hasWiki;
    data['issue_comment'] = this.issueComment;
    data['can_comment'] = this.canComment;
    data['pull_requests_enabled'] = this.pullRequestsEnabled;
    data['has_page'] = this.hasPage;
    data['license'] = this.license;
    data['outsourced'] = this.outsourced;
    data['project_creator'] = this.projectCreator;
    data['members'] = this.members;
    data['pushed_at'] = this.pushedAt.toIso8601String();
    data['created_at'] = this.createdAt.toIso8601String();
    data['updated_at'] = this.updatedAt.toIso8601String();
    data['parent'] = this.parent;
    data['paas'] = this.paas;
    data['assignees_number'] = this.assigneesNumber;
    data['testers_number'] = this.testersNumber;
    data['assignees'] = this.assignees;
    data['testers'] = this.testers;
    return data;
  }
}

class Namespace {
  int id;
  String type;
  String name;
  String path;
  String htmlUrl;

  Namespace({this.id, this.type, this.name, this.path, this.htmlUrl});

  Namespace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    path = json['path'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['path'] = this.path;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}

class SimpleGiteeUser {
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

  SimpleGiteeUser(
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
      this.type});

  SimpleGiteeUser.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
