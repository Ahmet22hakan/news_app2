// To parse this JSON data, do
//
//     final astrologyModel = astrologyModelFromJson(jsonString);

import 'dart:convert';

AstrologyModel astrologyModelFromJson(String str) => AstrologyModel.fromJson(json.decode(str));

String astrologyModelToJson(AstrologyModel data) => json.encode(data.toJson());

class AstrologyModel {
    final String? html;
    final Json? json;
    final int? status;

    AstrologyModel({
        this.html,
        this.json,
        this.status,
    });

    factory AstrologyModel.fromJson(Map<String, dynamic> json) => AstrologyModel(
        html: json["html"],
        json: json["json"] == null ? null : Json.fromJson(json["json"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "html": html,
        "json": json?.toJson(),
        "status": status,
    };
}

class Json {
    final String? title;
    final Robots? robots;
    final String? canonical;
    final String? ogLocale;
    final String? ogType;
    final String? ogTitle;
    final String? ogDescription;
    final String? ogUrl;
    final String? ogSiteName;
    final DateTime? articlePublishedTime;
    final DateTime? articleModifiedTime;
    final List<OgImage>? ogImage;
    final String? author;
    final String? twitterCard;
    final TwitterMisc? twitterMisc;
    final Schema? schema;

    Json({
        this.title,
        this.robots,
        this.canonical,
        this.ogLocale,
        this.ogType,
        this.ogTitle,
        this.ogDescription,
        this.ogUrl,
        this.ogSiteName,
        this.articlePublishedTime,
        this.articleModifiedTime,
        this.ogImage,
        this.author,
        this.twitterCard,
        this.twitterMisc,
        this.schema,
    });

    factory Json.fromJson(Map<String, dynamic> json) => Json(
        title: json["title"],
        robots: json["robots"] == null ? null : Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: json["og_locale"],
        ogType: json["og_type"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"],
        articlePublishedTime: json["article_published_time"] == null ? null : DateTime.parse(json["article_published_time"]),
        articleModifiedTime: json["article_modified_time"] == null ? null : DateTime.parse(json["article_modified_time"]),
        ogImage: json["og_image"] == null ? [] : List<OgImage>.from(json["og_image"]!.map((x) => OgImage.fromJson(x))),
        author: json["author"],
        twitterCard: json["twitter_card"],
        twitterMisc: json["twitter_misc"] == null ? null : TwitterMisc.fromJson(json["twitter_misc"]),
        schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "robots": robots?.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "article_published_time": articlePublishedTime?.toIso8601String(),
        "article_modified_time": articleModifiedTime?.toIso8601String(),
        "og_image": ogImage == null ? [] : List<dynamic>.from(ogImage!.map((x) => x.toJson())),
        "author": author,
        "twitter_card": twitterCard,
        "twitter_misc": twitterMisc?.toJson(),
        "schema": schema?.toJson(),
    };
}

class OgImage {
    final String? url;
    final int? width;
    final int? height;
    final String? type;

    OgImage({
        this.url,
        this.width,
        this.height,
        this.type,
    });

    factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
        "type": type,
    };
}

class Robots {
    final String? index;
    final String? follow;
    final String? maxSnippet;
    final String? maxImagePreview;
    final String? maxVideoPreview;

    Robots({
        this.index,
        this.follow,
        this.maxSnippet,
        this.maxImagePreview,
        this.maxVideoPreview,
    });

    factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json["index"],
        follow: json["follow"],
        maxSnippet: json["max-snippet"],
        maxImagePreview: json["max-image-preview"],
        maxVideoPreview: json["max-video-preview"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "follow": follow,
        "max-snippet": maxSnippet,
        "max-image-preview": maxImagePreview,
        "max-video-preview": maxVideoPreview,
    };
}

class Schema {
    final String? context;
    final List<Graph>? graph;

    Schema({
        this.context,
        this.graph,
    });

    factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: json["@graph"] == null ? [] : List<Graph>.from(json["@graph"]!.map((x) => Graph.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": graph == null ? [] : List<dynamic>.from(graph!.map((x) => x.toJson())),
    };
}

class Graph {
    final String? type;
    final String? id;
    final Breadcrumb? isPartOf;
    final Author? author;
    final String? headline;
    final DateTime? datePublished;
    final DateTime? dateModified;
    final Breadcrumb? mainEntityOfPage;
    final int? wordCount;
    final int? commentCount;
    final Breadcrumb? publisher;
    final List<String>? keywords;
    final List<String>? articleSection;
    final String? inLanguage;
    final List<PotentialAction>? potentialAction;
    final String? url;
    final String? name;
    final Breadcrumb? breadcrumb;
    final List<ItemListElement>? itemListElement;
    final String? description;
    final Image? logo;
    final Image? image;
    final List<String>? sameAs;

    Graph({
        this.type,
        this.id,
        this.isPartOf,
        this.author,
        this.headline,
        this.datePublished,
        this.dateModified,
        this.mainEntityOfPage,
        this.wordCount,
        this.commentCount,
        this.publisher,
        this.keywords,
        this.articleSection,
        this.inLanguage,
        this.potentialAction,
        this.url,
        this.name,
        this.breadcrumb,
        this.itemListElement,
        this.description,
        this.logo,
        this.image,
        this.sameAs,
    });

    factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json["@type"],
        id: json["@id"],
        isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
        headline: json["headline"],
        datePublished: json["datePublished"] == null ? null : DateTime.parse(json["datePublished"]),
        dateModified: json["dateModified"] == null ? null : DateTime.parse(json["dateModified"]),
        mainEntityOfPage: json["mainEntityOfPage"] == null ? null : Breadcrumb.fromJson(json["mainEntityOfPage"]),
        wordCount: json["wordCount"],
        commentCount: json["commentCount"],
        publisher: json["publisher"] == null ? null : Breadcrumb.fromJson(json["publisher"]),
        keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
        articleSection: json["articleSection"] == null ? [] : List<String>.from(json["articleSection"]!.map((x) => x)),
        inLanguage: json["inLanguage"],
        potentialAction: json["potentialAction"] == null ? [] : List<PotentialAction>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
        url: json["url"],
        name: json["name"],
        breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
        itemListElement: json["itemListElement"] == null ? [] : List<ItemListElement>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
        description: json["description"],
        logo: json["logo"] == null ? null : Image.fromJson(json["logo"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        sameAs: json["sameAs"] == null ? [] : List<String>.from(json["sameAs"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "isPartOf": isPartOf?.toJson(),
        "author": author?.toJson(),
        "headline": headline,
        "datePublished": datePublished?.toIso8601String(),
        "dateModified": dateModified?.toIso8601String(),
        "mainEntityOfPage": mainEntityOfPage?.toJson(),
        "wordCount": wordCount,
        "commentCount": commentCount,
        "publisher": publisher?.toJson(),
        "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "articleSection": articleSection == null ? [] : List<dynamic>.from(articleSection!.map((x) => x)),
        "inLanguage": inLanguage,
        "potentialAction": potentialAction == null ? [] : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
        "url": url,
        "name": name,
        "breadcrumb": breadcrumb?.toJson(),
        "itemListElement": itemListElement == null ? [] : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
        "description": description,
        "logo": logo?.toJson(),
        "image": image?.toJson(),
        "sameAs": sameAs == null ? [] : List<dynamic>.from(sameAs!.map((x) => x)),
    };
}

class Author {
    final String? name;
    final String? id;

    Author({
        this.name,
        this.id,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        id: json["@id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "@id": id,
    };
}

class Breadcrumb {
    final String? id;

    Breadcrumb({
        this.id,
    });

    factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
    );

    Map<String, dynamic> toJson() => {
        "@id": id,
    };
}

class Image {
    final String? id;
    final String? type;
    final String? inLanguage;
    final String? url;
    final String? contentUrl;
    final String? caption;
    final int? width;
    final int? height;

    Image({
        this.id,
        this.type,
        this.inLanguage,
        this.url,
        this.contentUrl,
        this.caption,
        this.width,
        this.height,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["@id"],
        type: json["@type"],
        inLanguage: json["inLanguage"],
        url: json["url"],
        contentUrl: json["contentUrl"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "inLanguage": inLanguage,
        "url": url,
        "contentUrl": contentUrl,
        "caption": caption,
        "width": width,
        "height": height,
    };
}

class ItemListElement {
    final String? type;
    final int? position;
    final String? name;
    final String? item;

    ItemListElement({
        this.type,
        this.position,
        this.name,
        this.item,
    });

    factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
        type: json["@type"],
        position: json["position"],
        name: json["name"],
        item: json["item"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "position": position,
        "name": name,
        "item": item,
    };
}

class PotentialAction {
    final String? type;
    final String? name;
    final dynamic target;
    final String? queryInput;

    PotentialAction({
        this.type,
        this.name,
        this.target,
        this.queryInput,
    });

    factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
        type: json["@type"],
        name: json["name"],
        target: json["target"],
        queryInput: json["query-input"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "name": name,
        "target": target,
        "query-input": queryInput,
    };
}

class TargetClass {
    final String? type;
    final String? urlTemplate;

    TargetClass({
        this.type,
        this.urlTemplate,
    });

    factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: json["@type"],
        urlTemplate: json["urlTemplate"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "urlTemplate": urlTemplate,
    };
}

class TwitterMisc {
    final String? yazan;
    final String? tahminiOkumaSresi;

    TwitterMisc({
        this.yazan,
        this.tahminiOkumaSresi,
    });

    factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        yazan: json["Yazan:"],
        tahminiOkumaSresi: json["Tahmini okuma süresi"],
    );

    Map<String, dynamic> toJson() => {
        "Yazan:": yazan,
        "Tahmini okuma süresi": tahminiOkumaSresi,
    };
}
