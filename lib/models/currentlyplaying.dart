// To parse this JSON data, do
//
//     final currentlyplaying = currentlyplayingFromJson(jsonString);

import 'dart:convert';

Currentlyplaying currentlyplayingFromJson(String str) => Currentlyplaying.fromJson(json.decode(str));

String currentlyplayingToJson(Currentlyplaying data) => json.encode(data.toJson());

class Currentlyplaying {
  Currentlyplaying({
    this.timestamp,
    this.context,
    this.progressMs,
    this.item,
    this.currentlyPlayingType,
    this.actions,
    this.isPlaying,
  });

  int? timestamp;
  Context? context;
  int? progressMs;
  Item? item;
  String? currentlyPlayingType;
  Actions? actions;
  bool? isPlaying;

  factory Currentlyplaying.fromJson(Map<String, dynamic> json) => Currentlyplaying(
    timestamp: json["timestamp"],
    context: Context.fromJson(json["context"]),
    progressMs: json["progress_ms"],
    item: Item.fromJson(json["item"]),
    currentlyPlayingType: json["currently_playing_type"],
    actions: Actions.fromJson(json["actions"]),
    isPlaying: json["is_playing"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "context": context?.toJson(),
    "progress_ms": progressMs,
    "item": item?.toJson(),
    "currently_playing_type": currentlyPlayingType,
    "actions": actions?.toJson(),
    "is_playing": isPlaying,
  };
}

class Actions {
  Actions({
    this.disallows,
  });

  Disallows? disallows;

  factory Actions.fromJson(Map<String, dynamic> json) => Actions(
    disallows: Disallows.fromJson(json["disallows"]),
  );

  Map<String, dynamic> toJson() => {
    "disallows": disallows?.toJson(),
  };
}

class Disallows {
  Disallows({
    this.resuming,
  });

  bool? resuming;

  factory Disallows.fromJson(Map<String, dynamic> json) => Disallows(
    resuming: json["resuming"],
  );

  Map<String, dynamic> toJson() => {
    "resuming": resuming,
  };
}

class Context {
  Context({
    this.externalUrls,
    this.href,
    this.type,
    this.uri,
  });

  ExternalUrls? externalUrls;
  String? href;
  String? type;
  String? uri;

  factory Context.fromJson(Map<String, dynamic> json) => Context(
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "external_urls": externalUrls?.toJson(),
    "href": href,
    "type": type,
    "uri": uri,
  };
}

class ExternalUrls {
  ExternalUrls({
    this.spotify,
  });

  String? spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
    spotify: json["spotify"],
  );

  Map<String, dynamic> toJson() => {
    "spotify": spotify,
  };
}

class Item {
  Item({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  Album? album;
  List<Artist>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  String? name;
  int? popularity;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    album: Album.fromJson(json["album"]),
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
    availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
    discNumber: json["disc_number"],
    durationMs: json["duration_ms"],
    explicit: json["explicit"],
    externalIds: ExternalIds.fromJson(json["external_ids"]),
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    isLocal: json["is_local"],
    name: json["name"],
    popularity: json["popularity"],
    previewUrl: json["preview_url"],
    trackNumber: json["track_number"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "album": album?.toJson(),
    "artists": List<dynamic>.from(artists!.map((x) => x.toJson())),
    "available_markets": List<dynamic>.from(availableMarkets!.map((x) => x)),
    "disc_number": discNumber,
    "duration_ms": durationMs,
    "explicit": explicit,
    "external_ids": externalIds?.toJson(),
    "external_urls": externalUrls?.toJson(),
    "href": href,
    "id": id,
    "is_local": isLocal,
    "name": name,
    "popularity": popularity,
    "preview_url": previewUrl,
    "track_number": trackNumber,
    "type": type,
    "uri": uri,
  };
}

class Album {
  Album({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  String? albumType;
  List<Artist>? artists;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  DateTime? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    albumType: json["album_type"],
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
    availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    name: json["name"],
    releaseDate: DateTime.parse(json["release_date"]),
    releaseDatePrecision: json["release_date_precision"],
    totalTracks: json["total_tracks"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "album_type": albumType,
    "artists": List<dynamic>.from(artists!.map((x) => x.toJson())),
    "available_markets": List<dynamic>.from(availableMarkets!.map((x) => x)),
    "external_urls": externalUrls?.toJson(),
    "href": href,
    "id": id,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "name": name,
    "release_date": "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
    "release_date_precision": releaseDatePrecision,
    "total_tracks": totalTracks,
    "type": type,
    "uri": uri,
  };
}

class Artist {
  Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    name: json["name"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "external_urls": externalUrls?.toJson(),
    "href": href,
    "id": id,
    "name": name,
    "type": type,
    "uri": uri,
  };
}

class Image {
  Image({
    this.height,
    this.url,
    this.width,
  });

  int? height;
  String? url;
  int? width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    height: json["height"],
    url: json["url"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "url": url,
    "width": width,
  };
}

class ExternalIds {
  ExternalIds({
    this.isrc,
  });

  String? isrc;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
    isrc: json["isrc"],
  );

  Map<String, dynamic> toJson() => {
    "isrc": isrc,
  };
}
