// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
    final int? id;
    final String? title;
    final String? url;
    final Type? type;
    final Type? subtype;
    final Links? links;

    SearchModel({
        this.id,
        this.title,
        this.url,
        this.type,
        this.subtype,
        this.links,
    });

    SearchModel copyWith({
        int? id,
        String? title,
        String? url,
        Type? type,
        Type? subtype,
        Links? links,
    }) => 
        SearchModel(
            id: id ?? this.id,
            title: title ?? this.title,
            url: url ?? this.url,
            type: type ?? this.type,
            subtype: subtype ?? this.subtype,
            links: links ?? this.links,
        );

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        type: typeValues.map[json["type"]]!,
        subtype: typeValues.map[json["subtype"]]!,
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "type": typeValues.reverse[type],
        "subtype": typeValues.reverse[subtype],
        "_links": links?.toJson(),
    };
}

class Links {
    final List<Self>? self;
    final List<About>? about;
    final List<About>? collection;

    Links({
        this.self,
        this.about,
        this.collection,
    });

    Links copyWith({
        List<Self>? self,
        List<About>? about,
        List<About>? collection,
    }) => 
        Links(
            self: self ?? this.self,
            about: about ?? this.about,
            collection: collection ?? this.collection,
        );

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? [] : List<Self>.from(json["self"]!.map((x) => Self.fromJson(x))),
        about: json["about"] == null ? [] : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null ? [] : List<About>.from(json["collection"]!.map((x) => About.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x.toJson())),
        "about": about == null ? [] : List<dynamic>.from(about!.map((x) => x.toJson())),
        "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x.toJson())),
    };
}

class About {
    final String? href;

    About({
        this.href,
    });

    About copyWith({
        String? href,
    }) => 
        About(
            href: href ?? this.href,
        );

    factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Self {
    final bool? embeddable;
    final String? href;

    Self({
        this.embeddable,
        this.href,
    });

    Self copyWith({
        bool? embeddable,
        String? href,
    }) => 
        Self(
            embeddable: embeddable ?? this.embeddable,
            href: href ?? this.href,
        );

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

enum Type {
    POST
}

final typeValues = EnumValues({
    "post": Type.POST
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
