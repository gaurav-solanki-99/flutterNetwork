

import 'dart:convert';

AllUser allUserFromJson(String str) => AllUser.fromJson(json.decode(str));

String allUserToJson(AllUser data) => json.encode(data.toJson());

class AllUser {
  AllUser({
   required this.code,
    required this.meta,
    required this.data,
  });

  int code;
  Meta meta;
  List<Datum> data;

  factory AllUser.fromJson(Map<String, dynamic> json) => AllUser(
    code: json["code"],
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.email,
    // required this.gender,
    // required this.status,
  });

  int id;
  String name;
  String email;
  // Gender gender;
  // Status status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    // gender: genderValues.map[json["gender"]],
    // status: statusValues.map[json["status"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    // "gender": genderValues.reverse[gender],
    // "status": statusValues.reverse[status],
  };
}

// enum Gender { FEMALE, MALE }
//
// final genderValues = EnumValues({
//   "female": Gender.FEMALE,
//   "male": Gender.MALE
// });

// enum Status { INACTIVE, ACTIVE }
//
// final statusValues = EnumValues({
//   "active": Status.ACTIVE,
//   "inactive": Status.INACTIVE
// });

class Meta {
  Meta({
    required this.pagination,
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
    required  this.limit,
  });



  int total;
  int pages;
  int page;
  int limit;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    pages: json["pages"],
    page: json["page"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "pages": pages,
    "page": page,
    "limit": limit,
  };
}

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
