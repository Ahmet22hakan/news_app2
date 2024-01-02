import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:news_app/blocs/search_bloc.dart';
import 'package:news_app/cards/card4.dart';
import 'package:news_app/utils/empty.dart';
import 'package:news_app/utils/loading_cards.dart';
import 'package:news_app/utils/snacbar.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 0)).then((value) => context.read<SearchBloc>().saerchInitialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchBar(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // suggestion text

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, bottom: 5, right: 15),
              child: Text(
                context.watch<SearchBloc>().searchStarted == false ? '' : 'Arama sonuçları',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            context.watch<SearchBloc>().searchStarted == false ? SuggestionsUI() : Expanded(child: AfterSearchUI())
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: TextFormField(
        autofocus: true,
        controller: context.watch<SearchBloc>().textfieldCtrl,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Haber ara",
          hintStyle:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Theme.of(context).secondaryHeaderColor),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.close,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              context.read<SearchBloc>().saerchInitialize();
            },
          ),
        ),
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value) {
          if (value == '') {
            openSnacbar(context, 'Birşeyler yazın');
          } else {
            context.read<SearchBloc>().setSearchText(value);
          }
        },
      ),
    );
  }
}

class SuggestionsUI extends StatelessWidget {
  const SuggestionsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sb = context.watch<SearchBloc>();
    return Expanded(
      child: sb.recentSearchData.isEmpty
          ? EmptyPage(
              icon: Feather.search,
              message: 'Haber ara',
              message1: "Henüz herhangi bir haber aramadınız.\nŞimdi deneyin - size yardımcı olacağız",
            )
          : ListView.separated(
              padding: EdgeInsets.all(15),
              itemCount: sb.recentSearchData.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: ListTile(
                    title: Text(
                      sb.recentSearchData[index],
                      style: TextStyle(fontSize: 17),
                    ),
                    leading: Icon(
                      CupertinoIcons.time_solid,
                      color: Colors.grey[400],
                    ),
                    onTap: () {
                      context.read<SearchBloc>().setSearchText(sb.recentSearchData[index]);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class AfterSearchUI extends StatelessWidget {
  const AfterSearchUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<SearchBloc>();
    return Container(
      height: 500,
      child: EasyRefresh(
        header: MaterialHeader(),
        footer: context.read<SearchBloc>().data.length == 0 ? NotLoadFooter() : BezierFooter(),
        onRefresh: () {
          context.read<SearchBloc>().getData();
        },
        onLoad: () {
          context.read<SearchBloc>().getMoreData();
        },
        child: ListView.builder(
            itemCount: context.read<SearchBloc>().data.length == 0
                ? (context.read<SearchBloc>().loading ? 5 : 1)
                : context.read<SearchBloc>().data.length,
            itemBuilder: (context, index) {
              {
                if (context.read<SearchBloc>().data.length == 0 && context.read<SearchBloc>().loading) {
                  return Container(margin: EdgeInsets.all(8), child: LoadingCard(height: 120));
                }

                if (context.read<SearchBloc>().data.length == 0)
                  return EmptyPage(
                    icon: Feather.clipboard,
                    message: 'Haber bulunamadı',
                    message1: "",
                  );
                if (context.read<SearchBloc>().data.length - 1 > index) {
                  return Container(
                      margin: EdgeInsets.all(8),
                      child: Card4(d: context.read<SearchBloc>().data[index], heroTag: "asd$index"));
                }
                print("heyooo");
                return Container(
                  height: 50,
                  child: Opacity(
                    opacity: context.read<SearchBloc>().loading ? 1.0 : 0.0,
                    child: Center(
                      child: SizedBox(width: 32.0, height: 32.0, child: new CupertinoActivityIndicator()),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
