import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

import 'package:news_app/models/article.dart';
import 'package:news_app/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestBloc extends ChangeNotifier {
  bool gosterLanBeni = false;
  List<Article> _data = [];
  List<Article> get data => _data;
  var controller = WebViewController();

  bool _pageisLoading = false;
  bool get pageisLoading => _pageisLoading;
  bool browser_on = false;

  List<Widget> deneme = [];
  bool ready = false;
  void testeGit() {
    gosterLanBeni = true;
    notifyListeners();
  }

  void closeBrowser() {
    browser_on = false;
    notifyListeners();
  }

  void initi() async {
    ready = false;
    notifyListeners();

    var dio = Dio();
    var response = await dio.get('https://bulten360.com/kategori/test/');

    var asd = parse(response.data).getElementsByClassName("news-post-grid-thumbnail-wrap");
    int i = 0;
    asd.forEach(
      (element) {
        if (i < 4) {
          i++;
        } else {
          print(element.innerHtml);
          print(parse(element.innerHtml).getElementsByTagName("img")[0].attributes["data-src"]);
          _data.add(Article(
            title: parse(element.innerHtml).getElementsByTagName("img")[0].attributes["alt"],
            description: element.attributes["href"],
            thumbnailImagelUrl: parse(element.innerHtml).getElementsByTagName("img")[0].attributes["data-src"],
          ));
        }
      },
    );
    ready = true;
    notifyListeners();
  }

  void basicGetRequest(String url) async {
    browser_on = true;
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _pageisLoading = true;
    notifyListeners();
    controller.setNavigationDelegate(NavigationDelegate(
      onPageFinished: (url) async {
        await controller.runJavaScript("document.getElementsByClassName(\"elementor\")[0].remove();");
        await controller
            .runJavaScript("window.top.document.querySelectorAll('div[data-id=\"b848c43\"]')[0].remove()"); //
        await controller.runJavaScript("window.top.document.querySelectorAll('div[data-id=\"a9941fb\"]')[0].remove()");
        await controller.runJavaScript(
            "window.top.document.querySelectorAll('h2[class=\"elementor-heading-title elementor-size-default\"]')[0].remove()");
        await controller
            .runJavaScript("window.top.document.querySelectorAll('div[data-elementor-type=\"footer\"]')[0].remove()");
        _pageisLoading = false;
        notifyListeners();
      },
    ));

    controller.loadRequest(
      Uri.parse(
        url,
      ),
    );
  }
}
