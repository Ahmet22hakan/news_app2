import 'package:flutter/material.dart';
import 'package:news_app/blocs/test_bloc.dart';
import 'package:news_app/cards/card4.dart';
import 'package:news_app/cards/card5.dart';
import 'package:news_app/utils/loading_cards.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../cards/Test-Card.dart';

class TestPage extends StatefulWidget {
  const TestPage();

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<TestBloc>().initi();
    });
  }

  @override
  Widget build(BuildContext context) {
    var tb = context.watch<TestBloc>();

    return Scaffold(
      appBar: AppBar(
        leading: tb.browser_on
            ? IconButton(
                onPressed: () {
                  tb.closeBrowser();
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                  size: 22,
                ))
            : null,
        title: Text("360 Test"),
      ),
      body: Container(
        child: tb.browser_on
            ? Stack(
                children: [
                  WebViewWidget(
                    controller: tb.controller,
                  ),
                  if (tb.pageisLoading)
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.white,
                      child: Center(child: CircularProgressIndicator()),
                    )
                ],
              )
            : ListView.builder(
                itemCount: tb.ready ? tb.data.length : 5,
                itemBuilder: (context, index) {
                  if (tb.ready) {
                    return Container(
                        margin: EdgeInsets.all(8), child: CardTest(d: tb.data[index], heroTag: "aloweoefadefa$index"));
                  } else {
                    return Container(margin: EdgeInsets.all(8), child: LoadingCard(height: 200));
                  }
                },
              ),
      ),
    );
  }
}
