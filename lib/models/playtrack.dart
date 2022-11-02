// To parse this JSON data, do
//
//     final playtrack = playtrackFromJson(jsonString);

import 'dart:convert';

Playtrack playtrackFromJson(String str) => Playtrack.fromJson(json.decode(str));

String playtrackToJson(Playtrack data) => json.encode(data.toJson());

class Playtrack {
  Playtrack({
    this.uris,
    this.offset,
    this.positionMs,
  });

  List<String>? uris;
  OffsetTrack? offset;
  int? positionMs;

  factory Playtrack.fromJson(Map<String, dynamic> json) => Playtrack(
    uris: List<String>.from(json["uris"].map((x) => x)),
    offset: OffsetTrack.fromJson(json["offset"]),
    positionMs: json["position_ms"],
  );

  Map<String, dynamic> toJson() => {
    "uris": List<dynamic>.from(uris!.map((x) => x)),
    "offset": offset?.toJson(),
    "position_ms": positionMs,
  };
}

class OffsetTrack {
  OffsetTrack({
    this.position,
  });

  int? position;

  factory OffsetTrack.fromJson(Map<String, dynamic> json) => OffsetTrack(
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "position": position,
  };
}
