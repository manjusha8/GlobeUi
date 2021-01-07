import 'dart:convert';

LatestPromos latestPromosFromJson(String str) =>
    LatestPromos.fromJson(json.decode(str));

String latestPromosToJson(LatestPromos data) => json.encode(data.toJson());

class LatestPromos {
  LatestPromos({
    this.latestPromos,
  });

  List<LatestPromo> latestPromos;

  factory LatestPromos.fromJson(Map<String, dynamic> json) => LatestPromos(
        latestPromos: List<LatestPromo>.from(
            json["latest_promos"].map((x) => LatestPromo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latest_promos":
            List<dynamic>.from(latestPromos.map((x) => x.toJson())),
      };
}

class LatestPromo {
  LatestPromo({
    this.id,
    this.title,
    this.subtitle,
    this.images,
    this.images_icon,
  });

  int id;
  String title;
  String subtitle;
  String images;
  String images_icon;

  factory LatestPromo.fromJson(Map<String, dynamic> json) => LatestPromo(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        images: json["images"],
        images_icon: json["images_icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "images": images,
        "images_icon": images_icon,
      };
}
