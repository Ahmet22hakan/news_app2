import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:news_app/blocs/featured_bloc.dart';
import 'package:news_app/blocs/popular_articles_bloc.dart';
import 'package:news_app/blocs/recent_articles_bloc.dart';
import 'package:news_app/blocs/tab_index_bloc.dart';
import 'package:news_app/config/config.dart';
import 'package:news_app/pages/search.dart';
import 'package:news_app/utils/app_name.dart';
import 'package:news_app/utils/next_screen.dart';
import 'package:news_app/widgets/drawer.dart';
import 'package:news_app/widgets/tab_medium.dart';
import 'package:provider/provider.dart';


class Explore extends StatefulWidget {
  Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<Tab> _tabs = [
    Tab(
      text: "Güncel",
    ),
    Tab(
      text: Config().initialCategories[0],
    ),
    Tab(
      text: Config().initialCategories[1],
    ),
    Tab(
      text: Config().initialCategories[2],
    ),
    Tab(
      text: Config().initialCategories[3],
    ),
    Tab(
      text: Config().initialCategories[4],
    ),
    Tab(
      text: Config().initialCategories[5],
    ),
    Tab(
      text: Config().initialCategories[6],
    ),
    Tab(
      text: Config().initialCategories[7],
    ),
  ];

  @override
  void initState() {
    super.initState();
    context.read<TabIndexBloc>().tabController = TabController(length: _tabs.length, vsync: this);
    context.read<TabIndexBloc>().tabController!.addListener(() {
      context.read<TabIndexBloc>().setTabIndex(context.read<TabIndexBloc>().tabController!.index);
    });
    Future.delayed(Duration(milliseconds: 0)).then((value) {
      context.read<FeaturedBloc>().getData();
      context.read<RecentBloc>().getData(mounted, "memo");
      context.read<PopularBloc>().getData();
    });
  }

  @override
  void dispose() {
    context.read<TabIndexBloc>().tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      drawer: DrawerMenu(),
      key: scaffoldKey,
      body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          new SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            titleSpacing: 0,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppName(fontSize: 19.0),
              ],
            ),
            leading: IconButton(
              icon: Icon(
                Feather.menu,
                size: 25,
              ),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            elevation: 1,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  AntDesign.search1,
                  size: 22,
                ),
                onPressed: () {
                  nextScreen(context, SearchPage());
                },
              ),
              SizedBox(
                width: 5,
              )
            ],
            pinned: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              labelStyle: TextStyle(fontFamily: 'Manrope', fontSize: 15, fontWeight: FontWeight.w600),
              controller: context.read<TabIndexBloc>().tabController!,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Color(0xff5f6368), //niceish grey
              isScrollable: true,
              indicator: MD2Indicator(
                //it begins here
                indicatorHeight: 3,
                indicatorColor: Theme.of(context).primaryColor,
                indicatorSize: MD2IndicatorSize.normal,
              ),
              tabs: _tabs,
            ),
          ),
        ];
      }, body: Builder(
        builder: (BuildContext context) {
          final innerScrollController = PrimaryScrollController.of(context);
          return TabMedium(
            sc: innerScrollController,
            tc: context.read<TabIndexBloc>().tabController,
          );
        },
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
