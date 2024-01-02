
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/blocs/theme_bloc.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/utils/next_screen.dart';
import 'package:provider/provider.dart';

import '../services/api_service.dart';

class AstroAylikBloc extends ChangeNotifier {
  List<Article> _data = [];
  List<Article> get data => _data;
  bool gosterLanBeni = false;

  Article? _lastVisible;
  Article? get lastVisible => _lastVisible;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool? _hasData;
  bool? get hasData => _hasData;
  int currentPage = 1;
  Map<int, int> burclar = {
    0: 5465,
    1: 5467,
    2: 5473,
    3: 5472,
    4: 5569, // Aslan,
    5: 5470,
    6: 5567, //Akrep,
    7: 5471,
    8: 5570, //Balik,
    9: 5568, //Basak,
    10: 5474,
    11: 5475,
  };

    Map<int, String> burclarKapak = {
    0: "koc",//koc
    1: "boga",//boga
    2: "ikizler",//ikizler
    3: "yengec",//yengec
    4: "aslan", // Aslan,
    5: "terazi",//terazai
    6: "akrep", //Akrep,
    7: "yay",//yay
    8: "balik", //Balik,
    9: "basak", //Basak,
    10: "kova",//kova
    11: "oglak",//oglak
  };

  void astroyaGit() {
    gosterLanBeni = true;
    notifyListeners();  
  }

  Future<Null> getData(int tag, BuildContext context) async {
    _data.clear();
    _isLoading = true;
    notifyListeners();
    print("deneyum");
    var asdk = await api.getArticlesByCategoriTag(burclar[tag] ?? 5465, 5, currentPage);
    var element = asdk[0];
    _data.add(Article(
      title: element.yoastHeadJson.title.replaceAll(" - Bulten360.com", ""),
      date: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
      description: (context.read<ThemeBloc>().darkTheme ?? false)
          ? element.content.rendered
          : element.content.rendered.replaceAll("#ffffff", "#555555"),
      thumbnailImagelUrl:"https://bulten360.com/wp-content/uploads/2023/12/${burclarKapak[tag]}123.jpg" ,
      readingTime: element.yoastHeadJson.twitterMisc.tahminiOkumaSresi,
      timestamp: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
      category: element.yoastHeadJson.schema.graph[0].articleSection?[0].replaceAll("&amp;", "") ?? "hata",
    ));
    navigateToDetailsScreen(context, _data[0], "astromastro$tag");
    print("gellmesi lazım");
    print(_data.length);

    _isLoading = false;
    notifyListeners();
    return null;
  }

  setLoading(bool isloading) {
    _isLoading = isloading;
    notifyListeners();
  }
}
