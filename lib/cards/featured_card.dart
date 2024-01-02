import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/utils/cached_image.dart';
import 'package:news_app/utils/next_screen.dart';
import 'package:news_app/widgets/video_icon.dart';

class FeaturedCard extends StatelessWidget {
  final Article d;
  final heroTag;
  const FeaturedCard({Key? key, required this.d, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Stack(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Theme.of(context).shadowColor, blurRadius: 10, offset: Offset(0, 3))
                      ]),
                  child: Hero(tag: heroTag, child: CustomCacheImage(imageUrl: d.thumbnailImagelUrl, radius: 5)),
                ),
                VideoIcon(
                  contentType: d.contentType,
                  iconSize: 80,
                )
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        d.title!,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      /*
                      Row(
                        children: <Widget>[
                          Icon(CupertinoIcons.time, size: 16, color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Text(d.date!, style: TextStyle(color: Colors.white, fontSize: 13))
                        ],
                      )*/
                    ],
                  ),
                ))
          ],
        ),
      ),
      onTap: () => navigateToDetailsScreen(context, d, heroTag),
    );
  }
}
