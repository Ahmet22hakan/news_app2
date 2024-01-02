// To parse this JSON data, do
//
//     final wpArtircle = wpArtircleFromJson(jsonString);

import 'dart:convert';

List<WpArtircle> wpArtircleFromJson(String str) =>
    List<WpArtircle>.from(json.decode(str).map((x) => WpArtircle.fromJson(x)));

String wpArtircleToJson(List<WpArtircle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WpArtircle {
  final DateTime date;

  final Guid title;
  final Content content;

  final String yoastHead;
  final YoastHeadJson yoastHeadJson;

  WpArtircle({
    required this.date,
    required this.title,
    required this.content,
    required this.yoastHead,
    required this.yoastHeadJson,
  });

  factory WpArtircle.fromJson(Map<String, dynamic> json) => WpArtircle(
        date: DateTime.parse(json["date"] ?? DateTime.now().toString()),
        title: json["title"] == null ? Guid(rendered: "") : Guid.fromJson(json["title"]),
        content: json["content"] == null ? Content(rendered: "", protected: false) : Content.fromJson(json["content"]),
        yoastHead: json["yoast_head"],
        yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "title": title.toJson(),
        "content": content.toJson(),
        "yoast_head": yoastHead,
      };
}

class Content {
  final String rendered;
  final bool protected;

  Content({
    required this.rendered,
    required this.protected,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Guid {
  final String rendered;

  Guid({
    required this.rendered,
  });

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class YoastHeadJson {
  final String title;
  final String? description;
  final Robots robots;
  final String canonical;
  final OgLocale ogLocale;
  final OgType ogType;
  final String ogTitle;

  final String ogUrl;
  final DateTime articlePublishedTime;
  final DateTime? articleModifiedTime;
  final List<OgImage>? ogImage;
  final TwitterCard twitterCard;
  final TwitterMisc twitterMisc;
  final Schema schema;

  YoastHeadJson({
    required this.title,
    this.description,
    required this.robots,
    required this.canonical,
    required this.ogLocale,
    required this.ogType,
    required this.ogTitle,
    required this.ogUrl,
    required this.articlePublishedTime,
    this.articleModifiedTime,
    this.ogImage,
    required this.twitterCard,
    required this.twitterMisc,
    required this.schema,
  });

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        description: json["description"],
        robots: Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: ogLocaleValues.map[json["og_locale"]]!,
        ogType: ogTypeValues.map[json["og_type"]]!,
        ogTitle: json["og_title"],
        ogUrl: json["og_url"],
        articlePublishedTime: DateTime.parse(json["article_published_time"]),
        articleModifiedTime:
            json["article_modified_time"] == null ? null : DateTime.parse(json["article_modified_time"]),
        ogImage: json["og_image"] == null ? null : List<OgImage>.from(json["og_image"].map((x) => OgImage.fromJson(x))),
        twitterCard: twitterCardValues.map[json["twitter_card"]]!,
        twitterMisc: TwitterMisc.fromJson(json["twitter_misc"]),
        schema: Schema.fromJson(json["schema"]),
      );
}

class OgImage {
  final String url;

  OgImage({
    required this.url,
  });

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

enum OgLocale { TR_TR }

final ogLocaleValues = EnumValues({"tr_TR": OgLocale.TR_TR});

enum OgType { ARTICLE }

final ogTypeValues = EnumValues({"article": OgType.ARTICLE});

class Robots {
  final Index index;
  final Follow follow;
  final MaxSnippet maxSnippet;
  final MaxImagePreview maxImagePreview;
  final MaxVideoPreview maxVideoPreview;

  Robots({
    required this.index,
    required this.follow,
    required this.maxSnippet,
    required this.maxImagePreview,
    required this.maxVideoPreview,
  });

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: indexValues.map[json["index"]]!,
        follow: followValues.map[json["follow"]]!,
        maxSnippet: maxSnippetValues.map[json["max-snippet"]]!,
        maxImagePreview: maxImagePreviewValues.map[json["max-image-preview"]]!,
        maxVideoPreview: maxVideoPreviewValues.map[json["max-video-preview"]]!,
      );

  Map<String, dynamic> toJson() => {
        "index": indexValues.reverse[index],
        "follow": followValues.reverse[follow],
        "max-snippet": maxSnippetValues.reverse[maxSnippet],
        "max-image-preview": maxImagePreviewValues.reverse[maxImagePreview],
        "max-video-preview": maxVideoPreviewValues.reverse[maxVideoPreview],
      };
}

enum Follow { FOLLOW }

final followValues = EnumValues({"follow": Follow.FOLLOW});

enum Index { INDEX }

final indexValues = EnumValues({"index": Index.INDEX});

enum MaxImagePreview { MAX_IMAGE_PREVIEW_LARGE }

final maxImagePreviewValues = EnumValues({"max-image-preview:large": MaxImagePreview.MAX_IMAGE_PREVIEW_LARGE});

enum MaxSnippet { MAX_SNIPPET_1 }

final maxSnippetValues = EnumValues({"max-snippet:-1": MaxSnippet.MAX_SNIPPET_1});

enum MaxVideoPreview { MAX_VIDEO_PREVIEW_1 }

final maxVideoPreviewValues = EnumValues({"max-video-preview:-1": MaxVideoPreview.MAX_VIDEO_PREVIEW_1});

class Schema {
  final String context;
  final List<Graph> graph;

  Schema({
    required this.context,
    required this.graph,
  });

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": List<dynamic>.from(graph.map((x) => x.toJson())),
      };
}

class Graph {
  final List<String>? articleSection;

  Graph({
    this.articleSection,
  });

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        articleSection: json["articleSection"] == null ? [] : List<String>.from(json["articleSection"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "articleSection": articleSection == null ? [] : List<dynamic>.from(articleSection!.map((x) => x)),
      };
}

class Breadcrumb {
  final String id;

  Breadcrumb({
    required this.id,
  });

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
      };
}

class Image {
  final String id;
  final ImageType? type;
  final InLanguage? inLanguage;
  final String? url;
  final String? contentUrl;
  final int? width;
  final int? height;

  Image({
    required this.id,
    this.type,
    this.inLanguage,
    this.url,
    this.contentUrl,
    this.width,
    this.height,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["@id"],
        type: imageTypeValues.map[json["@type"]]!,
        inLanguage: inLanguageValues.map[json["inLanguage"]]!,
        url: json["url"],
        contentUrl: json["contentUrl"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": imageTypeValues.reverse[type],
        "inLanguage": inLanguageValues.reverse[inLanguage],
        "url": url,
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
      };
}

enum InLanguage { TR }

final inLanguageValues = EnumValues({"tr": InLanguage.TR});

enum ImageType { IMAGE_OBJECT }

final imageTypeValues = EnumValues({"ImageObject": ImageType.IMAGE_OBJECT});

class ItemListElement {
  final ItemListElementType type;
  final int position;
  final String name;
  final String? item;

  ItemListElement({
    required this.type,
    required this.position,
    required this.name,
    this.item,
  });

  factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
        type: itemListElementTypeValues.map[json["@type"]]!,
        position: json["position"],
        name: json["name"],
        item: json["item"],
      );

  Map<String, dynamic> toJson() => {
        "@type": itemListElementTypeValues.reverse[type],
        "position": position,
        "name": name,
        "item": item,
      };
}

enum ItemListElementType { LIST_ITEM }

final itemListElementTypeValues = EnumValues({"ListItem": ItemListElementType.LIST_ITEM});

enum QueryInput { REQUIRED_NAME_SEARCH_TERM_STRING }

final queryInputValues = EnumValues({"required name=search_term_string": QueryInput.REQUIRED_NAME_SEARCH_TERM_STRING});

class TargetClass {
  final TargetType type;
  final UrlTemplate urlTemplate;

  TargetClass({
    required this.type,
    required this.urlTemplate,
  });

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: targetTypeValues.map[json["@type"]]!,
        urlTemplate: urlTemplateValues.map[json["urlTemplate"]]!,
      );

  Map<String, dynamic> toJson() => {
        "@type": targetTypeValues.reverse[type],
        "urlTemplate": urlTemplateValues.reverse[urlTemplate],
      };
}

enum TargetType { ENTRY_POINT }

final targetTypeValues = EnumValues({"EntryPoint": TargetType.ENTRY_POINT});

enum UrlTemplate { HTTPS_BULTEN360_COM_S_SEARCH_TERM_STRING }

final urlTemplateValues =
    EnumValues({"https://bulten360.com/?s={search_term_string}": UrlTemplate.HTTPS_BULTEN360_COM_S_SEARCH_TERM_STRING});

enum PotentialActionType { COMMENT_ACTION, READ_ACTION, SEARCH_ACTION }

final potentialActionTypeValues = EnumValues({
  "CommentAction": PotentialActionType.COMMENT_ACTION,
  "ReadAction": PotentialActionType.READ_ACTION,
  "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum GraphType { ARTICLE, BREADCRUMB_LIST, ORGANIZATION, PERSON, WEB_PAGE, WEB_SITE }

final graphTypeValues = EnumValues({
  "Article": GraphType.ARTICLE,
  "BreadcrumbList": GraphType.BREADCRUMB_LIST,
  "Organization": GraphType.ORGANIZATION,
  "Person": GraphType.PERSON,
  "WebPage": GraphType.WEB_PAGE,
  "WebSite": GraphType.WEB_SITE
});

enum TwitterCard { SUMMARY_LARGE_IMAGE }

final twitterCardValues = EnumValues({"summary_large_image": TwitterCard.SUMMARY_LARGE_IMAGE});

class TwitterMisc {
  final String tahminiOkumaSresi;

  TwitterMisc({
    required this.tahminiOkumaSresi,
  });

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        tahminiOkumaSresi: json["Tahmini okuma süresi"] ?? "1 dakika",
      );

  Map<String, dynamic> toJson() => {
        "Tahmini okuma süresi": tahminiOkumaSresi,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
