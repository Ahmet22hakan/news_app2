import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:news_app/blocs/astro_aylik_bloc.dart';
import 'package:news_app/blocs/test_bloc.dart';
import 'package:news_app/blocs/theme_bloc.dart';
import 'package:news_app/pages/categories%20copy.dart';
import 'package:news_app/pages/explore.dart';
import 'package:news_app/pages/wp%20pages/astro.dart';
import 'package:news_app/pages/wp%20pages/test_page.dart';
import 'package:provider/provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/cards/card4.dart';
import 'package:news_app/cards/card5.dart';
import 'package:news_app/utils/loading_cards.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexeMindexe = 0;
  int _currentIndex = 0;
  PageController _pageController = PageController();

  GlobalKey<ConvexAppBarState> _appBarKey = GlobalKey<ConvexAppBarState>();
  List<IconData> iconList = [Feather.home, Feather.youtube, Feather.grid, Feather.user, Feather.user];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index, curve: Curves.easeIn, duration: Duration(milliseconds: 250));
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    _pageController.dispose();
    //HiveService().closeBoxes();
    super.dispose();
  }

  Future _onWillPop() async {
    if (_currentIndex == 3) {
      context.read<TestBloc>().closeBrowser();
      return false;
    }
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      _pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', true);
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<AstroAylikBloc>();
        context.watch<TestBloc>();

    context.watch<ThemeBloc>();
    if (context.read<AstroAylikBloc>().gosterLanBeni) {
      onTabTapped(4);
      _appBarKey.currentState?.animateTo(4);

      context.read<AstroAylikBloc>().gosterLanBeni = false;
    }

        if (context.read<TestBloc>().gosterLanBeni) {
      onTabTapped(3);
      _appBarKey.currentState?.animateTo(3);

      context.read<TestBloc>().gosterLanBeni = false;
    }


    return WillPopScope(
      onWillPop: () async => await _onWillPop(),
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        body: PageView(
          controller: _pageController,
          allowImplicitScrolling: false,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Explore(),
            VideoArticles(),
            Categories(),
            TestPage(),
            AstroPage()
            /*test,oyun*/
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    bool darkTheme = context.read<ThemeBloc>().darkTheme == false;
    return ConvexAppBar(
      key: _appBarKey,
      initialActiveIndex: indexeMindexe,
      backgroundColor: darkTheme ? Colors.white : Colors.grey.shade900,
      style: TabStyle.fixed,
      activeColor: darkTheme ? Color(0xff161616) : Colors.white,
      color: Colors.grey,
      top: -30,
      items: [
        TabItem(
          icon: Image.asset("assets/images/anasayfa.png"),
          activeIcon: Image.asset(
            "assets/images/anasayfa.png",
            color: darkTheme ? Color(0xff161616) : Colors.white,
          ),
          title: 'Ana Sayfa',
        ),
        TabItem(
            icon: Image.asset("assets/images/vdio.png"),
            title: 'Video',
            activeIcon: Image.asset(
              "assets/images/vdio.png",
              color: darkTheme ? Color(0xff161616) : Colors.white,
            )),
        TabItem(
          icon: Image.asset(
            "assets/images/ozel.png",
          ),
          title: '360 Mod',
        ),
        TabItem(
            icon: Image.asset("assets/images/Test.png"),
            title: 'Test',
            activeIcon: Image.asset(
              "assets/images/Test.png",
              color: darkTheme ? Color(0xff161616) : Colors.white,
            )),
        TabItem(
            icon: Image.asset("assets/images/game.png"),
            title: 'Astroloji',
            activeIcon: Image.asset(
              "assets/images/game.png",
              color: darkTheme ? Color(0xff161616) : Colors.white,
            )),
      ],
      onTap: (int i) => onTabTapped(i),
    );
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onTabTapped(index),
      currentIndex: _currentIndex,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      iconSize: 25,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(iconList[0]), label: 'home'),
        BottomNavigationBarItem(icon: Icon(iconList[1]), label: 'videos'),
        BottomNavigationBarItem(
            icon: Icon(
              iconList[2],
              size: 25,
            ),
            label: 'categories'),
        BottomNavigationBarItem(icon: Icon(iconList[3]), label: 'profile')
      ],
    );
  }
}



class VideoArticles extends StatefulWidget {
  VideoArticles({Key? key}) : super(key: key);

  @override
  _VideoArticlesState createState() => _VideoArticlesState();
}

class _VideoArticlesState extends State<VideoArticles> with AutomaticKeepAliveClientMixin {
  ScrollController? controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _orderBy = 'timestamp';
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'I0_06Z1k0hg',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );





  @override
  Widget build(BuildContext context) {
    super.build(context);
  

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text('360 Video'),
        elevation: 0,
        actions: <Widget>[
         IconButton(
            icon: Icon(
              Feather.rotate_cw,
              size: 22,
            ),
            onPressed: () async {
             
            },
          )
        ],
      ),
      body: PageView(
          scrollDirection: Axis.vertical,
          children: [
            VisibilityDetector(
              onVisibilityChanged: (info) {
                if (info.visibleFraction < 0.5) {
                  _controller.pause();
                }
              },
              key: Key("hellololoololololol"),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
          ],
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
