
import 'dart:convert';

import 'package:jingle/models/devices.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../constants.dart';
import 'dart:io';
import '../models/featured.dart';
import '../models/tracks.dart';
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
     // var featuredPlaylist = featuredFromJson(featuredData.body).playlists ;
     // List<PlaylistItem> listOfFeaturedItems = featuredPlaylist.items!;
     // print('Albums are :- $featuredPlaylist');

     //return listOfFeaturedItems;
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

   Future<List<AvailableDevice>> FetchDevies() async {

     String? deviceID = await _getId();

     var tracksData = await http.get(Uri.parse('https://api.spotify.com/v1/me/player/devices'),
       headers: {
         "content-type": 'application/json',
         "authorization": 'Bearer $Access_Token',
         // HttpHeaders.acceptHeader: 'application/json',
       },
     );
     List<AvailableDevice> tracksList = devicesFromJson(tracksData.body).devices! ;
     return tracksList;

     //Poco F1 - 8187ca277f6a02c99ccb7f649812b44aa4b16369
     //emulator - 64d484cbb96d617a331b9b8044ade1e3bba36e1b
     // var featuredPlaylist = featuredFromJson(featuredData.body).playlists ;
     // List<PlaylistItem> listOfFeaturedItems = featuredPlaylist.items!;
     // print('Albums are :- $featuredPlaylist');
     //return listOfFeaturedItems;
   }
}