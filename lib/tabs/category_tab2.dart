import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:news_app/cards/card1.dart';
import 'package:news_app/cards/card2.dart';
import 'package:news_app/utils/empty.dart';
import 'package:news_app/utils/loading_cards.dart';
import 'package:provider/provider.dart';

import '../blocs/category_tab2_bloc.dart';

class CategoryTab2 extends StatefulWidget {
  final String category;
  CategoryTab2({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryTab2State createState() => _CategoryTab2State();
}

class _CategoryTab2State extends State<CategoryTab2> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (this.mounted) {
      context.read<CategoryTab2Bloc>().data.isNotEmpty
          ? print('data already loaded')
          : context.read<CategoryTab2Bloc>().getData(mounted, widget.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cb = context.watch<CategoryTab2Bloc>();

    return EasyRefresh(
      footer:MaterialFooter(clamping: false),
      header: MaterialHeader(),
      onRefresh: () {
        context.read<CategoryTab2Bloc>().onRefresh(mounted, widget.category);
      },
      onLoad: () {
        context.read<CategoryTab2Bloc>().getMoreData(mounted, widget.category);
      },
      child: cb.hasData == false
          ? ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                EmptyPage(icon: Feather.clipboard, message: 'No articles found', message1: ''),
              ],
            )
          : ListView.separated(
              key: PageStorageKey(widget.category),
              padding: EdgeInsets.all(15),
              physics: NeverScrollableScrollPhysics(),
              itemCount: cb.data.length != 0 ? cb.data.length + 1 : 4,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 15,
              ),
              shrinkWrap: true,
              itemBuilder: (_, int index) {
                if (index < cb.data.length) {
                  if (index % 2 == 0 && index != 0) return Card1(d: cb.data[index], heroTag: 'tab1$index');
                  return Card2(d: cb.data[index], heroTag: 'tab1$index');
                }
                return Opacity(
                  opacity: cb.isLoading ? 1.0 : 0.0,
                  child: cb.data.length < 1
                      ? LoadingCard(height: 250)
                      : Container(
                          height: 50,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(width: 32.0, height: 32.0, child: new CupertinoActivityIndicator()),
                          ),
                        ),
                );
              },
            ),
    );
  }
}
