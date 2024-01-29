import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:news_app/blocs/astro_aylik_bloc.dart';
import 'package:news_app/blocs/astro_bloc.dart';

import 'package:news_app/cards/card1.dart';
import 'package:news_app/utils/empty.dart';
import 'package:news_app/utils/loading_cards.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with AutomaticKeepAliveClientMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController? controller;
  int tag = 2029;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) {
      context.read<AstroBloc>().getData(2029);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final cb = context.watch<AstroBloc>();
    Map<int, String> modum = {
      2029: "Mutlu",
      2030: "Mutsuz",
      2031: "Kızgın",
      5512: "Aşık",
      2035: "Hüzünlü",
      2033: "Düşünceli",
      2034: "Şaşkın"
    };

    var gridView = Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              "Bugün modun nasıl haberleri okumak istiyor?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: [
              GestureDetector(
                onTap: () {
                  tag = 2029;
                  context.read<AstroBloc>().getData(tag);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: tag == 2029
                              ? BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xfff7941e))
                              : null,
                          child:
                              Container(margin: EdgeInsets.all(5), child: Image.asset("assets/images/astro (6).png"))),
                    ),
                    Text(
                      "Mutlu",
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  tag = 2030;
                  context.read<AstroBloc>().getData(tag);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: tag == 2030
                              ? BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xfff7941e))
                              : null,
                          child:
                              Container(margin: EdgeInsets.all(5), child: Image.asset("assets/images/astro (7).png"))),
                    ),
                    Text("Mutsuz")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  tag = 2031;
                  context.read<AstroBloc>().getData(tag);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: tag == 2031
                              ? BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xfff7941e))
                              : null,
                          child:
                              Container(margin: EdgeInsets.all(5), child: Image.asset("assets/images/astro (5).png"))),
                    ),
                    Text("Kızgın")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  tag = 5512;
                  context.read<AstroBloc>().getData(tag);
                },
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                            decoration: tag == 5512
                                ? BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xfff7941e))
                                : null,
                            child: Container(
                                margin: EdgeInsets.all(5), child: Image.asset("assets/images/astro (1).png")))),
                    Text("Aşık")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  tag = 2035;
                  context.read<AstroBloc>().getData(tag);
                },
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                            decoration: tag == 2035
                                ? BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xfff7941e))
                                : null,
                            child: Container(
                                margin: EdgeInsets.all(5), child: Image.asset("assets/images/astro (4).png")))),
                    Text("Hüzünlü")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  tag = 2033;
                  context.read<AstroBloc>().getData(tag);
                },
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                            decoration: tag == 2033
                                ? BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xfff7941e))
                                : null,
                            child: Container(
                                margin: EdgeInsets.all(5), child: Image.asset("assets/images/astro (3).png")))),
                    Text("Düşünceli")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  tag = 2034;
                  context.read<AstroBloc>().getData(tag);
                },
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                            decoration: tag == 2034
                                ? BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xfff7941e))
                                : null,
                            child: Container(
                                margin: EdgeInsets.all(5), child: Image.asset("assets/images/astro (8).png")))),
                    Text("Şaşkın")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<AstroAylikBloc>().astroyaGit();
                },
                child: Column(
                  children: [
                    Expanded(
                        child: Container(margin: EdgeInsets.all(5), child: Image.asset("assets/images/astro (2).png"))),
                    Text("Burç Yorumu")
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 12,
            ),
            Text(
              modum[tag].toString() + " Paylaşımlar",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text('360 Mod'),
        elevation: 0,
       
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: EasyRefresh(
            header: MaterialHeader(),
            footer: MaterialFooter(),
            // footer: MaterialFooter(maxOverOffset: 150),
            onRefresh: () {
              context.read<AstroBloc>().getData(tag);
            },
            onLoad: () {
              context.read<AstroBloc>().getMoreData(tag);
            },
            child: cb.hasData == false
                ? ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                      ),
                      EmptyPage(icon: Feather.clipboard, message: 'Haberler bulunamadı', message1: ''),
                    ],
                  )
                : ListView.builder(
                    itemCount: cb.data.length == 0 ? 5 : (cb.data.length + 1),
                    itemBuilder: (context, index) {
                      if (cb.data.length == 0) {
                        if (index == 0) {
                          return gridView;
                        } else {
                          print("test");
                          return Container(
                              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              child: LoadingCard(height: 130));
                        }
                      }
                      if (index == 0) {
                        return gridView;
                      }
                      if (index < cb.data.length) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          child: Card1(
                            d: cb.data[index - 1],
                            heroTag: 'SanaOzel$index',
                          ),
                        );
                      }
                      print("\nNiye\n");
                      return Container(
                        height: cb.isLoading ? 100 : 100,
                        child: Opacity(
                          opacity: cb.isLoading ? 1.0 : 0.0,
                          child: Center(
                            child: SizedBox(width: 32.0, height: 32.0, child: new CupertinoActivityIndicator()),
                          ),
                        ),
                      );
                    },
                  )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
