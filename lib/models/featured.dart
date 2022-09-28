// To parse this JSON data, do
//
//     final featured = featuredFromJson(jsonString);

import 'dart:convert';

Featured featuredFromJson(String str) => Featured.fromJson(json.decode(str));

String featuredToJson(Featured data) => json.encode(data.toJson());

class Featured {
  Featured({
    this.message,
    required this.playlists,
  });

  String? message;
  Playlists playlists;

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
    message: json["message"],
    playlists: Playlists.fromJson(json["playlists"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "playlists": playlists.toJson(),
  };
}

class Playlists {
  Playlists({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  String? href;
  List<PlaylistItem>? items;
  int? limit;
  dynamic next;
  int? offset;
  dynamic previous;
  int? total;

  factory Playlists.fromJson(Map<String, dynamic> json) => Playlists(
    href: json["href"],
    items: List<PlaylistItem>.from(json["items"].map((x) => PlaylistItem.fromJson(x))),
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

class PlaylistItem {
  PlaylistItem({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  Owner? owner;
  dynamic primaryColor;
  dynamic public;
  String? snapshotId;
  Tracks? tracks;
  ItemType? type;
  String? uri;

  factory PlaylistItem.fromJson(Map<String, dynamic> json) => PlaylistItem(
    collaborative: json["collaborative"],
    description: json["description"],
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    name: json["name"],
    owner: Owner.fromJson(json["owner"]),
    primaryColor: json["primary_color"],
    public: json["public"],
    snapshotId: json["snapshot_id"],
    tracks: Tracks.fromJson(json["tracks"]),
    type: itemTypeValues.map[json["type"]],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "collaborative": collaborative,
    "description": description,
    "external_urls": externalUrls?.toJson(),
    "href": href,
    "id": id,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "name": name,
    "owner": owner!.toJson(),
    "primary_color": primaryColor,
    "public": public,
    "snapshot_id": snapshotId,
    "tracks": tracks!.toJson(),
    "type": itemTypeValues.reverse[type],
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

class Image {
  Image({
    this.height,
    this.url,
    this.width,
  });

  dynamic height;
  String? url;
  dynamic width;

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

class Owner {
  Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  DisplayName? displayName;
  ExternalUrls? externalUrls;
  String? href;
  Id? id;
  OwnerType? type;
  UriFeatured? uri;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    displayName: displayNameValues.map[json["display_name"]],
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: idValues.map[json["id"]],
    type: ownerTypeValues.map[json["type"]],
    uri: uriValues.map[json["uri"]],
  );

  Map<String, dynamic> toJson() => {
    "display_name": displayNameValues.reverse[displayName],
    "external_urls": externalUrls!.toJson(),
    "href": href,
    "id": idValues.reverse[id],
    "type": ownerTypeValues.reverse[type],
    "uri": uriValues.reverse[uri],
  };
}

enum DisplayName { SPOTIFY }

final displayNameValues = EnumValues({
  "Spotify": DisplayName.SPOTIFY
});

enum Id { SPOTIFY }

final idValues = EnumValues({
  "spotify": Id.SPOTIFY
});

enum OwnerType { USER }

final ownerTypeValues = EnumValues({
  "user": OwnerType.USER
});

enum UriFeatured { SPOTIFY_USER_SPOTIFY }

final uriValues = EnumValues({
  "spotify:user:spotify": UriFeatured.SPOTIFY_USER_SPOTIFY
});

class Tracks {
  Tracks({
    this.href,
    this.total,
  });

  String? href;
  int? total;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
    href: json["href"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "total": total,
  };
}

enum ItemType { PLAYLIST }

final itemTypeValues = EnumValues({
  "playlist": ItemType.PLAYLIST
});

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
