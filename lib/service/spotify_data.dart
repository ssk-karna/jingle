
import 'dart:convert';

import '../constants.dart';
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
}