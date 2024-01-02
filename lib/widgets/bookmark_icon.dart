import 'package:flutter/material.dart';

import 'package:news_app/utils/icons.dart';
import 'package:provider/provider.dart';

class BuildBookmarkIcon extends StatelessWidget {
  final String collectionName;

  final String? timestamp;

  const BuildBookmarkIcon({Key? key, required this.collectionName, required this.timestamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _type = 'bookmarked items';

    return StreamBuilder(
      builder: (context, AsyncSnapshot snap) {
        //   if ( == null) return BookmarkIcon().normal; //dön
        if (!snap.hasData) return BookmarkIcon().normal;
        List d = snap.data[_type];

        if (d.contains(timestamp)) {
          return BookmarkIcon().bold;
        } else {
          return BookmarkIcon().normal;
        }
      },
    );
  }
}
