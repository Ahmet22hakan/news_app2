import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:news_app/blocs/astro_aylik_bloc.dart';
import 'package:news_app/blocs/test_bloc.dart';
import 'package:news_app/blocs/theme_bloc.dart';
import 'package:news_app/blocs/video_bloc.dart';
import 'package:news_app/pages/categories%20copy.dart';
import 'package:news_app/pages/explore.dart';
import 'package:news_app/pages/wp%20pages/astro.dart';
import 'package:news_app/pages/wp%20pages/test_page.dart';
import 'package:news_app/services/hive_service.dart';
import 'package:provider/provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: 'I0_06Z1k0hg',
  flags: YoutubePlayerFlags(loop: true, mute: false, hideControls: true),
);

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

    if (index == 1) {
      context.read<VideoBloc>().inVideo();
    } else {
      context.read<VideoBloc>().outOfVideo();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    HiveService().closeBoxes();
    super.dispose();
  }

  Future _onWillPop() async {
    if (_currentIndex == 3) {
      if (context.read<TestBloc>().browser_on) {
        context.read<TestBloc>().closeBrowser();
      } else {
        _appBarKey.currentState?.animateTo(0);
        _pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      }

      return false;
    }
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      _pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      _appBarKey.currentState?.animateTo(0);
    } else {
      // await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', true);
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
      onWillPop: () async {
        return await _onWillPop();
      },
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
      curve: Curves.bounceIn,
      key: _appBarKey,
      initialActiveIndex: indexeMindexe,
      backgroundColor: darkTheme ? Colors.white : Colors.grey.shade900,
      style: TabStyle.fixed,
      activeColor: darkTheme ? Color(0xff161616) : Colors.white,
      color: Colors.grey,
      top: -20,
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var vb = context.watch<VideoBloc>();
    if (!vb.inVideoScreen) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text('360 Video'),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity - 300,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: YoutubePlayer(
                bottomActions: [
                  PlayPauseButton(),
                  ProgressBar(),
                ],
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              },
              child: Container(
                color: Colors.transparent,
                height: double.infinity,
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
