
import 'dart:convert';
import 'package:appcheck/appcheck.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:jingle/models/devices.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'dart:io';
import '../models/featured.dart';
import '../models/play.dart';
import '../models/playtrack.dart';
import '../models/tracks.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class SpotifyData{

   Future<List<PlaylistItem>> FetchFeaturedPlayists() async {
    var featuredData = await http.get(Uri.parse('https://api.spotify.com/v1/browse/featured-playlists'),
      headers: {
        "content-type": 'application/json',
        "authorization": 'Bearer $Access_Token',
        // HttpHeaders.acceptHeader: 'application/json',
      },
    );
    var featuredPlaylist = featuredFromJson(featuredData.body).playlists ;
    List<PlaylistItem> listOfFeaturedItems = featuredPlaylist.items!;
    print('Albums are :- $featuredPlaylist');
    return listOfFeaturedItems;
  }

   Future<List<TrackItems>> FetchPlayistsTracks(String playlist_id) async {
     var tracksData = await http.get(Uri.parse('https://api.spotify.com/v1/playlists/${playlist_id}/tracks'),
       headers: {
         "content-type": 'application/json',
         "authorization": 'Bearer $Access_Token',
         // HttpHeaders.acceptHeader: 'application/json',
       },
     );
     List<TrackItems> tracksList = tracksFromJson(tracksData.body).items! ;
     return tracksList;
   }

   Future<String?> _getId() async {
     var deviceInfo = DeviceInfoPlugin();
     if (Platform.isIOS) { // import 'dart:io'
       var iosDeviceInfo = await deviceInfo.iosInfo;
       return iosDeviceInfo.identifierForVendor; // unique ID on iOS
     } else if(Platform.isAndroid) {
       var androidDeviceInfo = await deviceInfo.androidInfo;
       return androidDeviceInfo.androidId; // unique ID on Android
     }
   }

   Future<void> LaunchSpotifyApp() async {
     await LaunchApp.openApp(
         androidPackageName: 'com.spotify.music');
   }

   Future<void> FetchDevies() async {

     final prefs = await SharedPreferences.getInstance();
     var devicesResponse = await http.get(Uri.parse('https://api.spotify.com/v1/me/player/devices'),
       headers: {
         "content-type": 'application/json',
         "authorization": 'Bearer $Access_Token',
         HttpHeaders.acceptHeader: 'application/json',
       },
     );
     List<AvailableDevice> availableDevices = devicesFromJson(devicesResponse.body).devices! ;
     await prefs.setString('deviceid', availableDevices[0].id.toString());
     Device_ID = prefs.getString('deviceid');
   }

   PlayTrack(String track_id) async {
     var offsetVal = OffsetTrack(position: 0);
     var selectedMusic = Playtrack(
         uris: ["spotify:track:$track_id"],
         offset: offsetVal,
         positionMs: 0
     );

     var playIt = await http.put(Uri.parse('https://api.spotify.com/v1/me/player/play?device_id=$Device_ID'),
         headers: {
           "Content-Type": 'application/json',
           "authorization": 'Bearer $Access_Token',
           // HttpHeaders.acceptHeader: 'application/json',
         },
         body: json.encode(selectedMusic)
     );
   }

    PlayMusic(String album_id) async {
     var offsetVal = Offset(position: 0);
     var selectedMusic = Play(
      contextUri: "spotify:album:$album_id",
       offset: offsetVal,
       positionMs: 0
     );

     var playIt = await http.put(Uri.parse('https://api.spotify.com/v1/me/player/play?device_id=$Device_ID'),
       headers: {
         "Content-Type": 'application/json',
         "authorization": 'Bearer $Access_Token',
         // HttpHeaders.acceptHeader: 'application/json',
       },
       body: json.encode(selectedMusic)
     );
    //  {
    //    "uris": ["spotify:track:1XIdLjLOIYCGtobNIXMwYS"],
    //   "offset": {
    //   "position": 0
    //   },
    //   "position_ms": 0
    // }
      //Poco F1 - 8187ca277f6a02c99ccb7f649812b44aa4b16369
      // emulator - 46a120cac612ddd2b6e38ce02daa395aba4e10e8
   }

   Future<void> CheckSpotifyInstalledOnDevice() async {
     if (Platform.isAndroid) {
       const package = "com.spotify.music";
       var _installedApps = await AppCheck.getInstalledApps();
       await AppCheck.checkAvailability(package).then(
             (app) => debugPrint(app.toString()),
       );

       await AppCheck.isAppEnabled(package).then(
             (enabled) => enabled
             ? debugPrint('$package enabled')
             : debugPrint('$package disabled'),
       );
   }
   }
}