import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/WordpressModels/post_models.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/api_service.dart';

class FeaturedBloc with ChangeNotifier {

  List<Article> _data = [];
  List<Article> get data => _data;

  List featuredList = [];

  bool _hasData = true;
  bool get hasData => _hasData;

  void getData() async {
    _data.clear();
    try {
      var asd = await api.getLastArticles(5, 1);
      if (asd.isNotEmpty) {
        _hasData = true;
        print("\n\n\nBaşladı\n\n\n");
        asd.forEach((element) {
          _data.add(Article(
            title: element.yoastHeadJson.title.replaceAll(" - Bulten360.com", "").replaceAll("amp;", ""),
            date: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
            description: element.content.rendered,
            thumbnailImagelUrl: element.yoastHeadJson.ogImage?[0].url ?? null,
            readingTime: element.yoastHeadJson.twitterMisc.tahminiOkumaSresi,
            timestamp: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
            category: element.yoastHeadJson.schema.graph[0].articleSection?[0].replaceAll("&amp;", "") ?? "hata",
          ));
        });
        print("\n\n\nBitti\n\n\n");
        notifyListeners();
      } else {
        _hasData = false;
      }
    } catch (e) {
      print(e);
    }
  }

  onRefresh() {
    featuredList.clear();
    _data.clear();
    _hasData = true;
    getData();
    notifyListeners();
  }
}
