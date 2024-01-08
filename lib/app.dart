
import 'package:flutter/material.dart';
import 'package:news_app/blocs/astro_bloc.dart';
import 'package:news_app/blocs/category_tab5_bloc.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%202.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%203.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%204.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%205.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%206.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%207.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%208.dart';
import 'package:news_app/blocs/recent_articles_bloc%20copy%209.dart';
import 'package:news_app/blocs/test_bloc.dart';
import 'package:news_app/blocs/video_bloc.dart';
import 'package:news_app/pages/splash.dart';
import 'package:provider/provider.dart';
import 'blocs/astro_aylik_bloc.dart';
import 'blocs/category_tab1_bloc.dart';
import 'blocs/category_tab2_bloc.dart';
import 'blocs/category_tab3_bloc.dart';
import 'blocs/category_tab4_bloc.dart';
import 'blocs/category_tab6_bloc.dart';
import 'blocs/category_tab7_bloc.dart';
import 'blocs/category_tab8_bloc.dart';
import 'blocs/featured_bloc.dart';
import 'blocs/popular_articles_bloc.dart';
import 'blocs/recent_articles_bloc.dart';
import 'blocs/search_bloc.dart';
import 'blocs/tab_index_bloc.dart';
import 'blocs/theme_bloc.dart';
import 'models/theme_model.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: Consumer<ThemeBloc>(
        builder: (_, mode, child) {
          return MultiProvider(
            providers: [
             
              
              ChangeNotifierProvider<SearchBloc>(create: (context) => SearchBloc()),
              ChangeNotifierProvider<FeaturedBloc>(create: (context) => FeaturedBloc()),
              ChangeNotifierProvider<PopularBloc>(create: (context) => PopularBloc()),
              ChangeNotifierProvider<RecentBloc>(create: (context) => RecentBloc()),
             
           
        
              ChangeNotifierProvider<TabIndexBloc>(create: (context) => TabIndexBloc()),
    
              ChangeNotifierProvider<CategoryTab1Bloc>(create: (context) => CategoryTab1Bloc()),
              ChangeNotifierProvider<CategoryTab2Bloc>(create: (context) => CategoryTab2Bloc()),
              ChangeNotifierProvider<CategoryTab3Bloc>(create: (context) => CategoryTab3Bloc()),
              ChangeNotifierProvider<CategoryTab4Bloc>(create: (context) => CategoryTab4Bloc()),
              ChangeNotifierProvider<CategoryTab1Bloc>(create: (context) => CategoryTab1Bloc()),
              ChangeNotifierProvider<CategoryTab2Bloc>(create: (context) => CategoryTab2Bloc()),
              ChangeNotifierProvider<CategoryTab3Bloc>(create: (context) => CategoryTab3Bloc()),
              ChangeNotifierProvider<CategoryTab4Bloc>(create: (context) => CategoryTab4Bloc()),
              ChangeNotifierProvider<CategoryTab5Bloc>(create: (context) => CategoryTab5Bloc()),
              ChangeNotifierProvider<CategoryTab6Bloc>(create: (context) => CategoryTab6Bloc()),
              ChangeNotifierProvider<CategoryTab7Bloc>(create: (context) => CategoryTab7Bloc()),
              ChangeNotifierProvider<CategoryTab8Bloc>(create: (context) => CategoryTab8Bloc()),
              ChangeNotifierProvider<RecentBloc2>(create: (context) => RecentBloc2()),
              ChangeNotifierProvider<RecentBloc3>(create: (context) => RecentBloc3()),
              ChangeNotifierProvider<RecentBloc4>(create: (context) => RecentBloc4()),
              ChangeNotifierProvider<RecentBloc5>(create: (context) => RecentBloc5()),
              ChangeNotifierProvider<RecentBloc6>(create: (context) => RecentBloc6()),
              ChangeNotifierProvider<RecentBloc7>(create: (context) => RecentBloc7()),
              ChangeNotifierProvider<RecentBloc8>(create: (context) => RecentBloc8()),
              ChangeNotifierProvider<RecentBloc9>(create: (context) => RecentBloc9()),
              ChangeNotifierProvider<AstroBloc>(create: (context) => AstroBloc()),
              ChangeNotifierProvider<AstroAylikBloc>(create: (context) => AstroAylikBloc()),
               ChangeNotifierProvider<TestBloc>(create: (context) => TestBloc()),
                         ChangeNotifierProvider<VideoBloc>(create: (context) => VideoBloc()),

            ],
            child: MaterialApp(              
                theme: ThemeModel().lightMode,
                darkTheme: ThemeModel().darkMode,
                themeMode: mode.darkTheme == true ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: SplashPage()),
          );
        },
      ),
    );
  }
}
