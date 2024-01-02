import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news_app/pages/search.dart';
import 'package:news_app/utils/next_screen.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
      height: 65,
      //color: Colors.green,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
         
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 10),
                height: 40,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  border: Border.all(color: Colors.grey[400]!, width: 0.5),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  'search news',
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor, fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              onTap: () {
                nextScreen(context, SearchPage());
              },
            ),
          ),
        ],
      ),
    );
  }
}
