// To parse this JSON data, do
//
//     final symptom = symptomFromJson(jsonString);

import 'dart:convert';

QuestionModel symptomFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String symptomToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    this.type,
    this.id,
    this.optional,
    this.text,
    this.options,
    this.range,
  });

  String? type;
  String? id;
  bool? optional;
  Text? text;
  List<Option>? options;
  dynamic range;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        type: json["type"],
        id: json["id"],
        optional: json["optional"],
        text: Text.fromJson(json["text"]),
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        range: json["range"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "optional": optional,
        "text": text!.toJson(),
        "options": List<dynamic>.from(options!.map((x) => x.toJson())),
        "range": range,
      };
}

class Option {
  Option({
    this.translation,
    this.value,
    this.color,
  });

  Translation? translation;
  String? value;
  Color? color;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        translation: Translation.fromJson(json["translation"]),
        value: json["value"],
        color: colorValues.map[json["color"]],
      );

  Map<String, dynamic> toJson() => {
        "translation": translation!.toJson(),
        "value": value,
        "color": colorValues.reverse[color],
      };
}

enum Color { BLUE }

final colorValues = EnumValues({"blue": Color.BLUE});

class Translation {
  Translation({
    this.en,
    this.fr,
  });

  String? en;
  String? fr;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        fr: json["fr"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "fr": fr,
      };
}

class Text {
  Text({
    this.translation,
  });

  Translation? translation;

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        translation: Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "translation": translation!.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map = {};
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
