

// To parse this JSON data, do
//
//     final tracks = tracksFromJson(jsonString);

import 'dart:convert';

Tracks tracksFromJson(String str) => Tracks.fromJson(json.decode(str));

String tracksToJson(Tracks data) => json.encode(data.toJson());

class Tracks {
  Tracks({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  String? href;
  List<TrackItems>? items;
  int? limit;
  dynamic next;
  int? offset;
  dynamic previous;
  int? total;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
    href: json["href"],
    items: List<TrackItems>.from(json["items"].map((x) => TrackItems.fromJson(x))),
    limit: json["limit"],
    next: json["next"],
    offset: json["offset"],
    previous: json["previous"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "limit": limit,
    "next": next,
    "offset": offset,
    "previous": previous,
    "total": total,
  };
}

class TrackItems {
  TrackItems({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  DateTime? addedAt;
  AddedBy? addedBy;
  bool? isLocal;
  dynamic primaryColor;
  Track? track;
  VideoThumbnail? videoThumbnail;

  factory TrackItems.fromJson(Map<String, dynamic> json) => TrackItems(
    addedAt: DateTime.parse(json["added_at"]),
    addedBy: AddedBy.fromJson(json["added_by"]),
    isLocal: json["is_local"],
    primaryColor: json["primary_color"],
    track: Track.fromJson(json["track"]),
    videoThumbnail: VideoThumbnail.fromJson(json["video_thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "added_at": addedAt?.toIso8601String(),
    "added_by": addedBy?.toJson(),
    "is_local": isLocal,
    "primary_color": primaryColor,
    "track": track?.toJson(),
    "video_thumbnail": videoThumbnail?.toJson(),
  };
}

class AddedBy {
  AddedBy({
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
    this.name,
  });

  ExternalUrls? externalUrls;
  String? href;
  String? id;
  AddedByType? type;
  String? uri;
  String? name;

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    type: addedByTypeValues.map[json["type"]],
    uri: json["uri"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "external_urls": externalUrls?.toJson(),
    "href": href,
    "id": id,
    "type": addedByTypeValues.reverse[type],
    "uri": uri,
    "name": name == null ? null : name,
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

enum AddedByType { USER, ARTIST }

final addedByTypeValues = EnumValues({
  "artist": AddedByType.ARTIST,
  "user": AddedByType.USER
});

class Track {
  Track({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.episode,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.name,
    this.popularity,
    this.previewUrl,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  Album? album;
  List<AddedBy>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? episode;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  String? name;
  int? popularity;
  String? previewUrl;
  bool? track;
  int? trackNumber;
  TrackType? type;
  String? uri;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    album: Album.fromJson(json["album"]),
    artists: List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromJson(x))),
    availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
    discNumber: json["disc_number"],
    durationMs: json["duration_ms"],
    episode: json["episode"],
    explicit: json["explicit"],
    externalIds: ExternalIds.fromJson(json["external_ids"]),
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    isLocal: json["is_local"],
    name: json["name"],
    popularity: json["popularity"],
    previewUrl: json["preview_url"] == null ? null : json["preview_url"],
    track: json["track"],
    trackNumber: json["track_number"],
    type: trackTypeValues.map[json["type"]],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "album": album?.toJson(),
    "artists": List<dynamic>.from(artists!.map((x) => x.toJson())),
    "available_markets": List<dynamic>.from(availableMarkets!.map((x) => x)),
    "disc_number": discNumber,
    "duration_ms": durationMs,
    "episode": episode,
    "explicit": explicit,
    "external_ids": externalIds?.toJson(),
    "external_urls": externalUrls?.toJson(),
    "href": href,
    "id": id,
    "is_local": isLocal,
    "name": name,
    "popularity": popularity,
    "preview_url": previewUrl == null ? null : previewUrl,
    "track": track,
    "track_number": trackNumber,
    "type": trackTypeValues.reverse[type],
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

  AlbumTypeEnum? albumType;
  List<AddedBy>? artists;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  String? releaseDate;
  ReleaseDatePrecision? releaseDatePrecision;
  int? totalTracks;
  AlbumTypeEnum? type;
  String? uri;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    albumType: albumTypeEnumValues.map[json["album_type"]],
    artists: List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromJson(x))),
    availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    name: json["name"],
    releaseDate: json["release_date"],
    releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]],
    totalTracks: json["total_tracks"],
    type: albumTypeEnumValues.map[json["type"]],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "album_type": albumTypeEnumValues.reverse[albumType],
    "artists": List<dynamic>.from(artists!.map((x) => x.toJson())),
    "available_markets": List<dynamic>.from(availableMarkets!.map((x) => x)),
    "external_urls": externalUrls?.toJson(),
    "href": href,
    "id": id,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "name": name,
    "release_date": releaseDate,
    "release_date_precision": releaseDatePrecisionValues.reverse[releaseDatePrecision],
    "total_tracks": totalTracks,
    "type": albumTypeEnumValues.reverse[type],
    "uri": uri,
  };
}

enum AlbumTypeEnum { SINGLE, ALBUM, COMPILATION }

final albumTypeEnumValues = EnumValues({
  "album": AlbumTypeEnum.ALBUM,
  "compilation": AlbumTypeEnum.COMPILATION,
  "single": AlbumTypeEnum.SINGLE
});

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

enum ReleaseDatePrecision { DAY, YEAR }

final releaseDatePrecisionValues = EnumValues({
  "day": ReleaseDatePrecision.DAY,
  "year": ReleaseDatePrecision.YEAR
});

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

enum TrackType { TRACK }

final trackTypeValues = EnumValues({
  "track": TrackType.TRACK
});

class VideoThumbnail {
  VideoThumbnail({
    this.url,
  });

  dynamic url;

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => VideoThumbnail(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
