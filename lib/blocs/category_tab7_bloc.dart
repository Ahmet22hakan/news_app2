import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/api_service.dart';

class CategoryTab7Bloc extends ChangeNotifier {
  List<Article> _data = [];
  List<Article> get data => _data;

  Article? _lastVisible;
  Article? get lastVisible => _lastVisible;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool? _hasData;
  bool? get hasData => _hasData;
  int currentPage = 1;

  Future<Null> getData(mounted, String category) async {
    _data.clear();
    currentPage = 1;
    _isLoading = true;

    var asdk = await api.getArticlesByCategoriId(19, 10, currentPage);
    asdk.forEach((element) {
      _data.add(Article(
        title: element.yoastHeadJson.title.replaceAll(" - Bulten360.com", "").replaceAll("&amp;", "&"),
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

  void getMoreData(mounted, String category) async {
    if (!_isLoading) {
      _isLoading = true;
      notifyListeners();
      currentPage += 1;

      var asdkl = await api.getArticlesByCategoriId(19, 10, currentPage);
      print("gelen boyutu");
      print(asdkl.length);
      print(currentPage);

      asdkl.forEach((element) {
        _data.add(Article(
          title: element.yoastHeadJson.title.replaceAll(" - Bulten360.com", "").replaceAll("&amp;", "&"),
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
    getData(mounted, category);
    notifyListeners();
  }
}
