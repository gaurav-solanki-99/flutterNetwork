// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required  this.meta,
    required   this.data,
  });

  Meta meta;
  List<Datum2> data;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum2>.from(json["data"].map((x) => Datum2.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum2 {
  Datum2({
   required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  int id;
  int userId;
  String title;
  String body;

  factory Datum2.fromJson(Map<String, dynamic> json) => Datum2(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "body": body,
  };
}

class Meta {
  Meta({
    required  this.pagination,
  });

  Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  Pagination({
    required  this.total,
    required this.pages,
    required this.page,
    required this.limit,
    required this.links,
  });

  int total;
  int pages;
  int page;
  int limit;
  Links links;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    pages: json["pages"],
    page: json["page"],
    limit: json["limit"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "pages": pages,
    "page": page,
    "limit": limit,
    "links": links.toJson(),
  };
}

class Links {
  Links({
    required  this.previous,
    required  this.current,
    required this.next,
  });

  dynamic previous;
  String current;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    previous: json["previous"],
    current: json["current"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "previous": previous,
    "current": current,
    "next": next,
  };
}
