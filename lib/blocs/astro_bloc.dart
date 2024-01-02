import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/article.dart';

import '../services/api_service.dart';

class AstroBloc extends ChangeNotifier {
  List<Article> _data = [];
  List<Article> get data => _data;



  Article? _lastVisible;
  Article? get lastVisible => _lastVisible;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool? _hasData;
  bool? get hasData => _hasData;
  int currentPage = 1;

  Future<Null> getData(int tag) async {
    currentPage = 1;
    _data.clear();
    _isLoading = true;
    notifyListeners();
    var asdk = await api.getArticlesByCategoriTag(tag, 5, currentPage);
    asdk.forEach((element) {
      _data.add(Article(
        title: element.yoastHeadJson.title.replaceAll(" - Bulten360.com", ""),
        date: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
        description: element.content.rendered,
        thumbnailImagelUrl: element.yoastHeadJson.ogImage?[0].url ?? null,
        readingTime: element.yoastHeadJson.twitterMisc.tahminiOkumaSresi,
        timestamp: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
        category: element.yoastHeadJson.schema.graph[0].articleSection?[0].replaceAll("&amp;", "") ?? "hata",
      ));
    });
    print(_data.length);

    _isLoading = false;
    notifyListeners();
    return null;
  }

  void getMoreData(int tag) async {
    if (!_isLoading) {
      _isLoading = true;
      currentPage += 1;
      notifyListeners();
      var asdkl = await api.getArticlesByCategoriTag(tag, 5, currentPage);
      print("gelen boyutu");
      print(asdkl.length);
      print(currentPage);

      asdkl.forEach((element) {
        _data.add(Article(
          title: element.yoastHeadJson.title.replaceAll(" - Bulten360.com", ""),
          date: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
          description: element.content.rendered,
          thumbnailImagelUrl: element.yoastHeadJson.ogImage?[0].url ?? null,
          readingTime: element.yoastHeadJson.twitterMisc.tahminiOkumaSresi,
          timestamp: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
          category: element.yoastHeadJson.schema.graph[0].articleSection?[0].replaceAll("&amp;", "") ?? "hata",
        ));
      });
      _isLoading = false;
      print(_data.length);
      notifyListeners();
    }
  }

  setLoading(bool isloading) {
    _isLoading = isloading;
    notifyListeners();
  }

  onRefresh(mounted, String category) {
    _isLoading = true;

    _data.clear();
    // _lastVisible = null;
    getData(2029);
    notifyListeners();
  }
}
