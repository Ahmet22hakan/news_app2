import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:news_app/models/article.dart';

class ViewsCount extends StatefulWidget {
  final Article article;
  const ViewsCount({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  _ViewsCountState createState() => _ViewsCountState();
}

class _ViewsCountState extends State<ViewsCount> {

  @override
  Widget build(BuildContext context) {
    return Container();
    }
}
