import 'package:graphqltest/author.dart';
class PostComment{
  String id;
  String text;
  String post;
  Author author;

  PostComment.fromJson(Map<String, dynamic> data){
    this.id = data['id'];
    this.text = data['text'];
    this.post = data['post'];
    this.author = data['author'];
  }
}