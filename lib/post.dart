import 'package:graphqltest/author.dart';
import 'package:graphqltest/post_comment.dart';
class PostData {
  String id;
  String title;
  String body;
  bool published;
  Author author;
  List<PostComment> comment;

  PostData.fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.title = data['title'];
    this.body = data['body'];
    this.published = data['published'];
    this.author =
    (data['author'] != null ? Author.fromJson(data['author']) : null);
    this.comment = (data['comments'] as List)
        ?.map((e) => new PostComment.fromJson(e))
        ?.toList();
  }
}