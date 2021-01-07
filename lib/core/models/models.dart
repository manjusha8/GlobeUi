import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.balancedata,
  });

  List<Balancedatum> balancedata;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        balancedata: List<Balancedatum>.from(
            json["balancedata"].map((x) => Balancedatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "balancedata": List<dynamic>.from(balancedata.map((x) => x.toJson())),
      };
}

class Balancedatum {
  Balancedatum({
    this.id,
    this.image,
    this.category,
    this.amount,
    this.validity,
    this.data,
  });

  int id;
  String image;
  String category;
  String amount;
  String validity;
  String data;

  factory Balancedatum.fromJson(Map<String, dynamic> json) => Balancedatum(
        id: json["id"],
        image: json["image"],
        category: json["category"],
        amount: json["amount"] == null ? null : json["amount"],
        validity: json["validity"],
        data: json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "category": category,
        "amount": amount == null ? null : amount,
        "validity": validity,
        "data": data == null ? null : data,
      };
}
