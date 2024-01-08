import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_app/blocs/recent_articles_bloc%20copy%209.dart';

import 'package:news_app/cards/card5.dart';
import 'package:provider/provider.dart';

class RecentArticles9 extends StatefulWidget {
  RecentArticles9({Key? key}) : super(key: key);

  @override
  _RecentArticles9State createState() => _RecentArticles9State();
}

class _RecentArticles9State extends State<RecentArticles9> {
  @override
  Widget build(BuildContext context) {
    final rb = context.watch<RecentBloc9>();

    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 22,
                  width: 4,
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 6,
                ),
                Text('Kaçırmayın',
                    style: TextStyle(fontSize: 18, letterSpacing: -0.6, wordSpacing: 1, fontWeight: FontWeight.bold)),
              ],
            )),
        ListView.separated(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          physics: NeverScrollableScrollPhysics(),
          itemCount: rb.data.length != 0 ? rb.data.length + 1 : 1,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 15,
          ),
          shrinkWrap: true,
          itemBuilder: (_, int index) {
            if (index < rb.data.length) {
              return Card5(
                d: rb.data[index],
                heroTag: 'recent$index',
              );
            }
            return Opacity(
              opacity: rb.isLoading ? 1.0 : 0.0,
              child: Center(
                child: SizedBox(width: 32.0, height: 32.0, child: new CupertinoActivityIndicator()),
              ),
            );
          },
        )
      ],
    );
  }
}
