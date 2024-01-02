import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:news_app/blocs/astro_aylik_bloc.dart';
import 'package:news_app/blocs/featured_bloc.dart';
import 'package:news_app/blocs/popular_articles_bloc.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%203.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%204.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%205.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%206.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%207.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%208.dart';
import 'package:news_app/blocs/recent_articles_bloc.dart';
import 'package:news_app/widgets/featured.dart';
import 'package:news_app/widgets/popular_articles.dart';
import 'package:news_app/widgets/recent_articles%20copy%202.dart';
import 'package:news_app/widgets/recent_articles%20copy%203.dart';
import 'package:news_app/widgets/recent_articles%20copy%204.dart';
import 'package:news_app/widgets/recent_articles%20copy%205.dart';
import 'package:news_app/widgets/recent_articles%20copy%206.dart';
import 'package:news_app/widgets/recent_articles%20copy%207.dart';
import 'package:news_app/widgets/recent_articles%20copy8.dart';
import 'package:news_app/widgets/recent_articles.dart';
import 'package:news_app/widgets/search_bar.dart';
import 'package:provider/provider.dart';

import '../blocs/recent_articles_bloc copy 2.dart';

Map<int, String> burclar = {
  0: "Koç",
  1: "Boğa",
  2: "İkizler",
  3: "Yengeç",
  4: "Aslan",
  5: "Terazi",
  6: "Akrep",
  7: "Yay",
  8: "Balık",
  9: "Başak",
  10: "Kova",
  11: "Oğlak",
};

class Tab0 extends StatefulWidget {
  Tab0({Key? key}) : super(key: key);

  @override
  _Tab0State createState() => _Tab0State();
}

class _Tab0State extends State<Tab0> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<FeaturedBloc>().onRefresh();
        context.read<PopularBloc>().onRefresh();
        context.read<RecentBloc>().onRefresh(mounted);
        context.read<RecentBloc2>().onRefresh();
        context.read<RecentBloc3>().onRefresh(mounted);
        context.read<RecentBloc4>().onRefresh(mounted);
        context.read<RecentBloc5>().onRefresh(mounted);
        context.read<RecentBloc6>().onRefresh(mounted);
        context.read<RecentBloc7>().onRefresh(mounted);
        context.read<RecentBloc8>().onRefresh(mounted);
      },
      child: EasyRefresh(
        footer: MaterialFooter(),
        onLoad: () {
         context.read<PopularBloc>().getMoreData();
        },
        child: SingleChildScrollView(
          key: PageStorageKey('key0'),
          padding: EdgeInsets.all(0),
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              // SearchBar(),
              Featured(),
              RecentArticles(),
              RecentArticles2(),
              Astro(),
              RecentArticles3(),
              RecentArticles4(),
              RecentArticles5(),
              RecentArticles7(),
              RecentArticles6(),
      
              RecentArticles8(),
              PopularArticles(),
            ],
          ),
        ),
      ),
    );
  }
}

class Astro extends StatefulWidget {
  const Astro();

  @override
  State<Astro> createState() => _AstroState();
}

class _AstroState extends State<Astro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      color: Color(0xff161616),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/astroana.png",
                  height: 30,
                ),
                Text(
                  "Astroloji",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(4),
                    height: 1,
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 100,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(0, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/koc.png")),
                              Text(
                                "Koç",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(1, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/boga.png")),
                              Text(
                                "Boğa",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(2, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/ikizler.png")),
                              Text(
                                "İkizler",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(6, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/akrep.png")),
                              Text(
                                "Akrep",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(7, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/Yay.png")),
                              Text(
                                "Yay",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(8, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/balık.png")),
                              Text(
                                "Balık",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(3, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/Yengec.png")),
                              Text(
                                "Yengeç",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(4, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/aslan.png")),
                              Text(
                                "Aslan",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(5, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/Terazi.png")),
                              Text(
                                "Terazi",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(9, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/basak.png")),
                              Text(
                                "Başak",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(10, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/Kova.png")),
                              Text(
                                "Kova",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AstroAylikBloc>().getData(11, context);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(child: Image.asset("assets/images/Oglak.png")),
                              Text(
                                "Oğlak",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
