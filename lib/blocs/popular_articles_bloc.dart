import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/article.dart';

import '../services/api_service.dart';

class PopularBloc extends ChangeNotifier {
  List<Article> _data = [];
  List<Article> get data => _data; // bundan çekiya pb.data[index]
  int currentPage = 1;
  bool isLoading = false;

  Future<Null> getData() async {
    _data.clear();
    currentPage = 1;
    isLoading = true;
    notifyListeners();

    var asdk = await api.getLastArticles(10, currentPage);
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

    isLoading = false;
    notifyListeners();
    return null;
  }

  Future<Null> getMoreData() async {
    currentPage += 1;
    isLoading = true;
    notifyListeners();
    var asdk = await api.getLastArticles(10, currentPage);
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

    isLoading = false;
    notifyListeners();
    return null;
  }

  onRefresh() {
    _data.clear();
    getData();
    notifyListeners();
  }
}
