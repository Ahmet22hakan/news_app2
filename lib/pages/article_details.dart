import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:news_app/blocs/ads_bloc.dart';

import 'package:news_app/blocs/theme_bloc.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/custom_color.dart';

import 'package:news_app/services/app_service.dart';
import 'package:news_app/utils/cached_image.dart';
import 'package:news_app/widgets/banner_ad_admob.dart'; //admob
//import 'package:news_app/widgets/banner_ad_fb.dart';      //fb ad
import 'package:news_app/widgets/bookmark_icon.dart';
import 'package:news_app/widgets/html_body.dart';
import 'package:news_app/widgets/love_count.dart';
import 'package:news_app/widgets/love_icon.dart';

import 'package:news_app/widgets/views_count.dart';
import 'package:share/share.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../utils/next_screen.dart';

class ArticleDetails extends StatefulWidget {
  final Article? data;
  final String? tag;

  const ArticleDetails({Key? key, required this.data, required this.tag}) : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  double rightPaddingValue = 130;

  handleBookmarkClick() {

  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      setState(() {
        rightPaddingValue = 10;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Article article = widget.data!;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: true,
          top: false,
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    _customAppBar(article, context),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: context.watch<ThemeBloc>().darkTheme == false
                                                  ? CustomColor().loadingColorLight
                                                  : CustomColor().loadingColorDark,
                                            ),
                                            child: AnimatedPadding(
                                              duration: Duration(milliseconds: 1000),
                                              padding: EdgeInsets.only(
                                                  left: 10, right: rightPaddingValue, top: 5, bottom: 5),
                                              child: Text(
                                                article.category ?? "Kategori eklenecek",
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                              ),
                                            )),

                                        /*
                                        IconButton(
                                            icon: BuildLoveIcon(
                                                collectionName: 'contents', uid: sb.uid, timestamp: article.timestamp),
                                            onPressed: () {
                                              handleLoveClick();
                                            }),
                                        IconButton(
                                            icon: BuildBookmarkIcon(
                                                collectionName: 'contents', uid: sb.uid, timestamp: article.timestamp),
                                            onPressed: () {
                                              handleBookmarkClick();
                                            }),*/
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.date_range, size: 20, color: Colors.grey),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          article.date ?? "",
                                          style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(CupertinoIcons.timer, size: 18, color: Colors.grey),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          article.readingTime!,
                                          style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      article.title!,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -0.6,
                                          wordSpacing: 1),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Divider(
                                      color: Theme.of(context).primaryColor,
                                      endIndent: 200,
                                      thickness: 2,
                                      height: 1,
                                    ),
                                    /*     TextButton.icon(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.resolveWith(
                                            (states) => EdgeInsets.only(left: 10, right: 10)),
                                        backgroundColor: MaterialStateProperty.resolveWith(
                                            (states) => Theme.of(context).primaryColor),
                                        shape: MaterialStateProperty.resolveWith(
                                            (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
                                      ),
                                      icon: Icon(Feather.message_circle, color: Colors.white, size: 20),
                                      label: Text('comments', style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        nextScreen(context, CommentsPage(timestamp: article.timestamp));
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),*/
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                child: HtmlBodyWidget(
                                  content: article.description!,
                                  isIframeVideoEnabled: true,
                                  isVideoEnabled: true,
                                  isimageEnabled: false,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          /*  Container(
                              padding: EdgeInsets.all(20),
                              child: RelatedArticles(
                                category: article.category,
                                timestamp: article.timestamp,
                                replace: true,
                              )),*/

                          //dön
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // -- Banner ads --

              context.watch<AdsBloc>().bannerAdEnabled == false ? Container() : BannerAdAdmob() //admob
              //: BannerAdFb()    //fb
            ],
          ),
        ));
  }

  SliverAppBar _customAppBar(Article article, BuildContext context) {
    return SliverAppBar(
      expandedHeight: 270,
      flexibleSpace: FlexibleSpaceBar(
          background: widget.tag == null
              ? CustomCacheImage(imageUrl: article.thumbnailImagelUrl, radius: 0.0)
              : Hero(
                  tag: widget.tag!,
                  child: CustomCacheImage(imageUrl: article.thumbnailImagelUrl, radius: 0.0),
                )),
      leading: IconButton(
        icon: const Icon(Icons.keyboard_backspace, size: 22, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        article.sourceUrl == null
            ? Container()
            : IconButton(
                icon: const Icon(Feather.external_link, size: 22, color: Colors.white),
                onPressed: () => AppServicek().openLinkWithCustomTab(context, article.sourceUrl!),
              ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}
