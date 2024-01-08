import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/WordpressModels/post_models.dart';
import 'package:news_app/models/article.dart';
import '../services/api_service.dart';

class SearchBloc with ChangeNotifier {
  List<String> _recentSearchData = [];
  List<String> get recentSearchData => _recentSearchData;

  String _searchText = '';
  String get searchText => _searchText;

  bool _searchStarted = false;
  bool loading = false;
  bool get searchStarted => _searchStarted;
  List<Article> data = [];
  TextEditingController _textFieldCtrl = TextEditingController();
  TextEditingController get textfieldCtrl => _textFieldCtrl;
  int currentPage = 1;
  Future<List> getData() async {
    loading = true;
    notifyListeners();
    currentPage = 1;
    data.clear();

    List<WpArtircle> asd = await api.getArticlesBySearching(_textFieldCtrl.text, 10, currentPage);
    notifyListeners();
    print("sayısı bu asd:${asd.length}");

    asd.forEach((element) {
      data.add(Article(
        title: element.yoastHeadJson.title.replaceAll(" - Bulten360.com", "").replaceAll("&amp;", "&"),
        date: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
        description: element.content.rendered,
        thumbnailImagelUrl: element.yoastHeadJson.ogImage?[0].url ?? null,
        readingTime: element.yoastHeadJson.twitterMisc.tahminiOkumaSresi,
        timestamp: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
        category: element.yoastHeadJson.schema.graph[0].articleSection?[0].replaceAll("&amp;", "") ?? "hata",
      ));
    });

    print(data.length);
    loading = false;
    notifyListeners();
    return data;
  }

  Future<List> getMoreData() async {
    loading = true;
    notifyListeners();
    currentPage += 1;
    List<WpArtircle> asd = await api.getArticlesBySearching(_textFieldCtrl.text, 10, currentPage);

    print("sayısı bu asd:${asd.length}");

    asd.forEach((element) {
      data.add(Article(
        title: element.yoastHeadJson.title.replaceAll(" - Bulten360.com", "").replaceAll("&amp;", "&"),
        date: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
        description: element.content.rendered,
        thumbnailImagelUrl: element.yoastHeadJson.ogImage?[0].url ?? null,
        readingTime: element.yoastHeadJson.twitterMisc.tahminiOkumaSresi,
        timestamp: DateFormat("dd MMMM yy", 'tr_TR').format(element.yoastHeadJson.articlePublishedTime),
        category: element.yoastHeadJson.schema.graph[0].articleSection?[0].replaceAll("&amp;", "") ?? "hata",
      ));
    });

    print(data.length);
    loading = false;
    notifyListeners();
    return data;
  }

  setSearchText(value) {
    _textFieldCtrl.text = value;
    _searchText = value;
    _searchStarted = true;
    getData();
  }

  saerchInitialize() {
    _textFieldCtrl.clear();
    _searchStarted = false;
    notifyListeners();
  }
}
