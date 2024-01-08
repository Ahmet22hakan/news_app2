import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/api_service.dart';

class RecentBloc4 extends ChangeNotifier {
  List<Article> _data = [];
  List<Article> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;


  Future<Null> getData() async {
    _data.clear();

    _isLoading = true;

    var asdk = await api.getArticlesByCategoriId(21, 5, 1);
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

  setLoading(bool isloading) {
    _isLoading = isloading;
    notifyListeners();
  }

  onRefresh(mounted) {
    _isLoading = true;

    _data.clear();

    getData();
    notifyListeners();
  }

  // Future getData() async {
  //   QuerySnapshot rawData;
  //     rawData = await firestore
  //         .collection('places')
  //         .orderBy('timestamp', descending: true)
  //         .limit(10)
  //         .get();

  //     List<DocumentSnapshot> _snap = [];
  //     _snap.addAll(rawData.docs);
  //     _data = _snap.map((e) => Article.fromFirestore(e)).toList();
  //     notifyListeners();

  // }

  // onRefresh(mounted) {
  //   _data.clear();
  //   getData();
  //   notifyListeners();
  // }
}
