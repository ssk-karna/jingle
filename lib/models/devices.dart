// To parse this JSON data, do
//
//     final devices = devicesFromJson(jsonString);

import 'dart:convert';

Devices devicesFromJson(String str) => Devices.fromJson(json.decode(str));

String devicesToJson(Devices data) => json.encode(data.toJson());

class Devices {
  Devices({
    this.devices,
  });

  List<AvailableDevice>? devices;

  factory Devices.fromJson(Map<String, dynamic> json) => Devices(
    devices: List<AvailableDevice>.from(json["devices"].map((x) => AvailableDevice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "devices": List<dynamic>.from(devices!.map((x) => x.toJson())),
  };
}

class AvailableDevice {
  AvailableDevice({
    this.id,
    this.isActive,
    this.isPrivateSession,
    this.isRestricted,
    this.name,
    this.type,
    this.volumePercent,
  });

  String? id;
  bool? isActive;
  bool? isPrivateSession;
  bool? isRestricted;
  String? name;
  String? type;
  int? volumePercent;

  factory AvailableDevice.fromJson(Map<String, dynamic> json) => AvailableDevice(
    id: json["id"],
    isActive: json["is_active"],
    isPrivateSession: json["is_private_session"],
    isRestricted: json["is_restricted"],
    name: json["name"],
    type: json["type"],
    volumePercent: json["volume_percent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_active": isActive,
    "is_private_session": isPrivateSession,
    "is_restricted": isRestricted,
    "name": name,
    "type": type,
    "volume_percent": volumePercent,
  };
}
