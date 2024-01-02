import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';
import 'package:news_app/blocs/astro_aylik_bloc.dart';
import 'package:news_app/blocs/tab_index_bloc.dart';
import 'package:news_app/blocs/test_bloc.dart';
import 'package:news_app/blocs/theme_bloc.dart';

import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<ThemeBloc>();
    final List titles = [
      'Test',
      'Burç Yorumları',
      'Magazin',
      'Teknoloji',
      'Sağlık & Yaşam',
      'Spor',
      'Ekonomi, Finans',
      'Turizm, Seyahat',
      'İş Dünyası',
      "Kültür & Sanat"
    ];


    final List<Widget> imageList = [
      Image.asset("assets/images/TestIcon.png"),
      Image.asset("assets/images/astroIcon.png"),
      Image.asset("assets/images/magazinIcon.png"),
      Image.asset("assets/images/teknoIcon.png"),
      Image.asset("assets/images/saglikIcon.png"),
      Image.asset("assets/images/sporIcon.png"),
      Image.asset("assets/images/finansIcon.png"),
      Image.asset("assets/images/turizmIcon.png"),
      Image.asset("assets/images/isIcon.png"),
      Image.asset("assets/images/kulturIcon.png"),
    ];

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              //color: context.watch<ThemeBloc>().darkTheme == false ? CustomColor().drawerHeaderColorLight : CustomColor().drawerHeaderColorDark,
              padding: EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (context.read<ThemeBloc>().darkTheme ?? false)
                    Image.asset(
                      "assets/images/logodisi.png",
                      height: 70,
                    ),
                  if (!(context.read<ThemeBloc>().darkTheme ?? false))
                    Image.asset(
                      "assets/images/splash.png",
                      height: 70,
                    )
                ],
              ),
            ),
            Container(
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 30),
                itemCount: titles.length + 1,
                shrinkWrap: true,
                separatorBuilder: (ctx, idx) => Divider(
                  height: 0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return ListTile(
                      title: Text('Gece modu'),
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(color: Colors.grey[600], borderRadius: BorderRadius.circular(500)),
                        child: Icon(LineIcons.sun, size: 22, color: Colors.white),
                      ),
                      trailing: Switch(
                          activeColor: Theme.of(context).primaryColor,
                          value: context.watch<ThemeBloc>().darkTheme!,
                          onChanged: (bool) {
                            context.read<ThemeBloc>().toggleTheme();
                          }),
                    );
                  }
                  return ListTile(
                    dense: true,
                    title: Text(
                      titles[index - 1],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    leading: Container(height: 35, width: 35, child: imageList[index - 1]),
                    onTap: () async {
                      Navigator.pop(context);
                      if (index == 1) {
                      context.read<TestBloc>().testeGit();
                      } else if (index == 2) {
                        context.read<AstroAylikBloc>().astroyaGit();
                      } else if (index == 3) {
                        context.read<TabIndexBloc>().setTabIndex(1);
                        context
                            .read<TabIndexBloc>()
                            .tabController!
                            .animateTo(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
                        // AppServicek().openLinkWithCustomTab(context, Config().ourWebsiteUrl);
                      } else if (index == 4) {
                        context.read<TabIndexBloc>().setTabIndex(2);
                        context
                            .read<TabIndexBloc>()
                            .tabController!
                            .animateTo(2, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      } else if (index == 5) {
                        context.read<TabIndexBloc>().setTabIndex(3);
                        context
                            .read<TabIndexBloc>()
                            .tabController!
                            .animateTo(3, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      } else if (index == 6) {
                        context.read<TabIndexBloc>().setTabIndex(5);
                        context
                            .read<TabIndexBloc>()
                            .tabController!
                            .animateTo(5, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      } else if (index == 7) {
                        context.read<TabIndexBloc>().setTabIndex(4);
                        context
                            .read<TabIndexBloc>()
                            .tabController!
                            .animateTo(4, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      } else if (index == 8) {
                        context.read<TabIndexBloc>().setTabIndex(6);
                        context
                            .read<TabIndexBloc>()
                            .tabController!
                            .animateTo(6, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      } else if (index == 9) {
                        context.read<TabIndexBloc>().setTabIndex(7);
                        context
                            .read<TabIndexBloc>()
                            .tabController!
                            .animateTo(7, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      } else if (index == 10) {
                        context.read<TabIndexBloc>().setTabIndex(8);
                        context
                            .read<TabIndexBloc>()
                            .tabController!
                            .animateTo(8, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
