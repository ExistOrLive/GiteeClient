import 'GiteeRepo.dart';
import 'GiteeUser.dart';

class GiteeIssue {
  int id;
  String url;
  String repositoryUrl;
  String labelsUrl;
  String commentsUrl;
  String htmlUrl;
  String parentUrl;
  String number;
  int parentId;
  int depth;
  String state;
  String title;
  String body;
  GiteeUser user;
  List<String> labels;
  String assignee;
  List<String> collaborators;
  GiteeRepo repository;
  Object milestone;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime planStartedAt;
  DateTime deadline;
  DateTime finishedAt;
  int scheduledTime;
  int comments;
  int priority;
  String issueType;
  Object program;
  bool securityHole;
  String issueState;
  String branch;

  GiteeIssue(
      {this.id,
      this.url,
      this.repositoryUrl,
      this.labelsUrl,
      this.commentsUrl,
      this.htmlUrl,
      this.parentUrl,
      this.number,
      this.parentId,
      this.depth,
      this.state,
      this.title,
      this.body,
      this.user,
      this.labels,
      this.assignee,
      this.collaborators,
      this.repository,
      this.milestone,
      this.createdAt,
      this.updatedAt,
      this.planStartedAt,
      this.deadline,
      this.finishedAt,
      this.scheduledTime,
      this.comments,
      this.priority,
      this.issueType,
      this.program,
      this.securityHole,
      this.issueState,
      this.branch});

  GiteeIssue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    repositoryUrl = json['repository_url'];
    labelsUrl = json['labels_url'];
    commentsUrl = json['comments_url'];
    htmlUrl = json['html_url'];
    parentUrl = json['parent_url'];
    number = json['number'];
    parentId = json['parent_id'];
    depth = json['depth'];
    state = json['state'];
    title = json['title'];
    body = json['body'];
    user = json['user'] != null ? new GiteeUser.fromJson(json['user']) : null;
    labels = json['labels'];
    assignee = json['assignee'];
    collaborators = json['collaborators'];
    repository = json['repository'] != null
        ? new GiteeRepo.fromJson(json['repository'])
        : null;
    milestone = json['milestone'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    planStartedAt = DateTime.parse(json['plan_started_at']);
    deadline = DateTime.parse(json['deadline']);
    finishedAt = DateTime.parse(json['finished_at']);
    scheduledTime = json['scheduled_time'];
    comments = json['comments'];
    priority = json['priority'];
    issueType = json['issue_type'];
    program = json['program'];
    securityHole = json['security_hole'];
    issueState = json['issue_state'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['repository_url'] = this.repositoryUrl;
    data['labels_url'] = this.labelsUrl;
    data['comments_url'] = this.commentsUrl;
    data['html_url'] = this.htmlUrl;
    data['parent_url'] = this.parentUrl;
    data['number'] = this.number;
    data['parent_id'] = this.parentId;
    data['depth'] = this.depth;
    data['state'] = this.state;
    data['title'] = this.title;
    data['body'] = this.body;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['lables'] = this.labels;
    data['assignee'] = this.assignee;
    data['collaborators'] = this.collaborators;
    if (this.repository != null) {
      data['repository'] = this.repository.toJson();
    }
    data['milestone'] = this.milestone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['plan_started_at'] = this.planStartedAt;
    data['deadline'] = this.deadline;
    data['finished_at'] = this.finishedAt;
    data['scheduled_time'] = this.scheduledTime;
    data['comments'] = this.comments;
    data['priority'] = this.priority;
    data['issue_type'] = this.issueType;
    data['program'] = this.program;
    data['security_hole'] = this.securityHole;
    data['issue_state'] = this.issueState;
    data['branch'] = this.branch;
    return data;
  }
}
