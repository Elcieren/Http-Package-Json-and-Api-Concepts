// To parse this JSON data, do
//
//     final araba = arabaFromMap(jsonString);


import 'dart:convert';

Araba arabaFromMap(String str) => Araba.fromMap(json.decode(str));

String arabaToMap(Araba data) => json.encode(data.toMap());

class Araba {
    final String arabaAdi;
    final String ulke;
    final int kurulusYili;
    final List<Model> model;

    Araba({
        required this.arabaAdi,
        required this.ulke,
        required this.kurulusYili,
        required this.model,
    });

    factory Araba.fromMap(Map<String, dynamic> json) => Araba(
        arabaAdi: json["araba_adi"],
        ulke: json["ulke"],
        kurulusYili: json["kurulus_yili"],
        model: List<Model>.from(json["model"].map((x) => Model.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "araba_adi": arabaAdi,
        "ulke": ulke,
        "kurulus_yili": kurulusYili,
        "model": List<dynamic>.from(model.map((x) => x.toMap())),
    };
}

class Model {
    final String modelAdi;
    final String fiyat;
    final bool benzili;

    Model({
        required this.modelAdi,
        required this.fiyat,
        required this.benzili,
    });

    factory Model.fromMap(Map<String, dynamic> json) => Model(
        modelAdi: json["model_adi"],
        fiyat: json["fiyat"],
        benzili: json["benzili"],
    );

    Map<String, dynamic> toMap() => {
        "model_adi": modelAdi,
        "fiyat": fiyat,
        "benzili": benzili,
    };
}

