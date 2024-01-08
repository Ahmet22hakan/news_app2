import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import '../../blocs/astro_aylik_bloc.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  _AstroState createState() => _AstroState();
}

class _AstroState extends State<GamePage> with AutomaticKeepAliveClientMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController? controller;
  int tag = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final cb = context.watch<AstroAylikBloc>();
    /*
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
*/
    var gridView = Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: GridView.count(
                crossAxisSpacing: 0,
                mainAxisSpacing: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                children: [
                  GestureDetector(
                    onTap: () {
                      tag = 0;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: tag == 0 ? null : null,
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/FantasyForest.png"),
                              )),
                        ),
                        Text(
                          "Fantasy Forest",
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 1;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: tag == 1 ? null : null,
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/CandyDiamond.png"),
                              )),
                        ),
                        Text("Candy Diamond")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 2;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: tag == 2 ? null : null,
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/Kelimelik.png"),
                              )),
                        ),
                        Text("Kelimelik")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 3;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 3 ? null : null,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset("assets/images/PacÇemberi.png"),
                                ))),
                        Text("Pac Çemberi")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 5;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 5 ? null : null,
                                child: Container(
                                    margin: EdgeInsets.all(5), child: Image.asset("assets/images/360Ninja.png")))),
                        Text("360 Ninja.png")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 6;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 6 ? null : null,
                                child: Container(
                                    margin: EdgeInsets.all(5), child: Image.asset("assets/images/AncherHero.png")))),
                        Text("Anchery Hero")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 7;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: tag == 7 ? null : null,
                          margin: EdgeInsets.all(5),
                          child: Image.asset("assets/images/WeightedSeesaw.png"),
                        )),
                        Text("Weighted Seesaw")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 8;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 8 ? null : null,
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/Frogtastic.png"))),
                        Text("Frogtastic")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 9;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 9 ? null : null,
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/ColorBallBounce.png"))),
                        Text("Color Ball Bounce")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 9;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 9 ? null : null,
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/LittleDinoAdventure.png"))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Text("Little Dino\nAdventure")),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 4;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 4 ? null : null,
                                child: Container(
                                    margin: EdgeInsets.all(5), child: Image.asset("assets/images/101Plus.png")))),
                        Text("101 Plus")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 10;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 10 ? null : null,
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/Batak.png"))),
                        Text("Batak")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 11;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 11 ? null : null,
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/TavlaPlus.png"))),
                        Text("Tavla Plus")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tag = 11;
                      context.read<AstroAylikBloc>().getData(tag, context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: tag == 11 ? null : null,
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/OkeyClassic.png"))),
                        Text("Okey Classic")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        if (cb.isLoading)
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white.withOpacity(0.3),
              child: Center(child: CircularProgressIndicator()))
      ],
    );

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_backspace,
                size: 22,
              )),
          title: Text(
            "360 Oyunlar",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: gridView);
  }

  @override
  bool get wantKeepAlive => true;
}
