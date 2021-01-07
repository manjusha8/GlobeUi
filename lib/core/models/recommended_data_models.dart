import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.recommendedData,
  });

  List<RecommendedDatum> recommendedData;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        recommendedData: List<RecommendedDatum>.from(
            json["recommended_data"].map((x) => RecommendedDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recommended_data":
            List<dynamic>.from(recommendedData.map((x) => x.toJson())),
      };
}

class RecommendedDatum {
  RecommendedDatum({
    this.id,
    this.title,
    this.days,
  });

  int id;
  String title;
  String days;

  factory RecommendedDatum.fromJson(Map<String, dynamic> json) =>
      RecommendedDatum(
        id: json["id"],
        title: json["title"],
        days: json["days"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "days": days,
      };
}
