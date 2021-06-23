import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqltest/post.dart';
import 'package:graphqltest/post_details.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage>{
  String postsQuery = """
query{
  posts{
    id
    title
    body
    published
  }
}
""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
      ),
      body:Container(
        child: Query(
          options:
          QueryOptions(
            document: gql(postsQuery),
            variables: {'nRepositories': 50,},
          ),

          builder: (QueryResult result,{ VoidCallback refetch,FetchMore fetchMore}){
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.isLoading) {
              return Text('Loading');
            }

//List<PostData> posts = result.data['posts'] ;
            List<PostData> posts = (result.data['posts'] as List)
                .map((e) => new PostData.fromJson(e)).toList();


            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final PostData post = posts[index];

                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostDetail()),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text(post.title),
                        subtitle: Text(post.body),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                  );
                });
          }, //builder
        ),
      ),

    );

  }

}