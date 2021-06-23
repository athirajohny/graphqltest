import 'package:graphqltest/post_comment.dart';
import 'package:graphqltest/post.dart';
class Author{
  String id;
  String name;
  String email;

  Author.fromJson(Map<String, dynamic>data){
    this.id = data['id'];
    this.name = data['name'];
    this.email = data['email'];
  }
}