import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


import '../models/article.dart';
import 'article_details.dart';

class PostNotificationDetails extends StatefulWidget {
  final String postID;
  PostNotificationDetails({Key? key, required this.postID}) : super(key: key);

  @override
  _PostNotificationDetailsState createState() => _PostNotificationDetailsState();
}

class _PostNotificationDetailsState extends State<PostNotificationDetails> {
  
  late Future _fetchData;

  Future<Article> fetchPostByPostId() async {
    Article? article;

    return article!;
  }

  @override
  void initState() {
    _fetchData = fetchPostByPostId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchData,
      builder: (context, AsyncSnapshot snap) {
        if (snap.connectionState == ConnectionState.active || snap.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: _LoadingIndicatorWidget()),
          );
        } else if (snap.hasError) {
          //print(snap.error);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Something is wrong. Please try again!'),
            ),
          );
        } else {
          Article article = snap.data;
          //print('article: ${article.title}');
          if (article.contentType == 'image') {
            return ArticleDetails(data: article, tag: null);
          } else if (article.contentType == 'video') {
          return ArticleDetails(data: article, tag: null);
          } else
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text('Something is wrong1. Please try again!'),
              ),
            );
        }
      },
    );
  }
}

class _LoadingIndicatorWidget extends StatelessWidget {
  const _LoadingIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 45,
        height: 60,
        child: LoadingIndicator(
          indicatorType: Indicator.ballBeat,
          pathBackgroundColor: Theme.of(context).primaryColor,
        ));
  }
}
