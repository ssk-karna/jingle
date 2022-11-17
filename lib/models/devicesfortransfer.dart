
// To parse this JSON data, do
//
//     final devicesForTransfer = devicesForTransferFromJson(jsonString);

import 'dart:convert';

DevicesForTransfer devicesForTransferFromJson(String str) => DevicesForTransfer.fromJson(json.decode(str));

String devicesForTransferToJson(DevicesForTransfer data) => json.encode(data.toJson());

class DevicesForTransfer {
  DevicesForTransfer({
    this.deviceIds,
  });

  List<String>? deviceIds;

  factory DevicesForTransfer.fromJson(Map<String, dynamic> json) => DevicesForTransfer(
    deviceIds: List<String>.from(json["device_ids"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "device_ids": List<dynamic>.from(deviceIds!.map((x) => x)),
  };
}
