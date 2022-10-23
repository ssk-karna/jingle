// To parse this JSON data, do
//
//     final play = playFromJson(jsonString);

import 'dart:convert';

Play playFromJson(String str) => Play.fromJson(json.decode(str));

String playToJson(Play data) => json.encode(data.toJson());

class Play {
  Play({
    this.contextUri,
    this.offset,
    this.positionMs,
  });

  String? contextUri;
  Offset? offset;
  int? positionMs;

  factory Play.fromJson(Map<String, dynamic> json) => Play(
    contextUri: json["context_uri"],
    offset: Offset.fromJson(json["offset"]),
    positionMs: json["position_ms"],
  );

  Map<String, dynamic> toJson() => {
    "context_uri": contextUri,
    "offset": offset!.toJson(),
    "position_ms": positionMs,
  };
}

class Offset {
  Offset({
    this.position,
  });

  int? position;

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "position": position,
  };
}
