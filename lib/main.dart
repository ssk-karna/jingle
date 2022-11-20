
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jingle/releases.dart';
import 'package:jingle/screens/HomePage.dart';
import 'package:jingle/screens/MusicPlayer.dart';
import 'package:jingle/screens/albumsList.dart';
import 'package:jingle/screens/loginPage.dart';
import 'package:jingle/service/remote_api_service.dart';
import 'constants.dart';
import 'models/featured.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpotifyData(),
    );
  }
}

class SpotifyData extends StatefulWidget {
  const SpotifyData({Key? key}) : super(key: key);

  @override
  State<SpotifyData> createState() => _SpotifyDataState();
}

class _SpotifyDataState extends State<SpotifyData> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  // CheckLogin();
  }

    //var auth = client.tok

//Then, instantiate the helper passing the previously instantiated client
//     OAuth2Helper oauth2Helper = OAuth2Helper(client,
//         grantType: OAuth2Helper.AUTHORIZATION_CODE,
//         clientId: '582fbe233ebf4bc4b130fd8943e97fe1',
//         clientSecret: '29e49c8621ed45ef95a9376c29f8dc72',
//         scopes: ["user-modify-playback-state,playlist-read-private"]);
//
//     var data = oauth2Helper.getToken();

   // http.Response resp = oauth2Helper.get('https://api.spotify.com/v1/albums/') as http.Response;

    // var credentials = await SpotifyApiCredentials( "582fbe233ebf4bc4b130fd8943e97fe1", "29e49c8621ed45ef95a9376c29f8dc72");
    // var spotify = SpotifyApi(credentials);
    // var albums =  spotify.albums.get("4rOoJ6Egrf8K2IrywzwOMk");

    // await SpotifySdk.connectToSpotifyRemote(clientId: "582fbe233ebf4bc4b130fd8943e97fe1", redirectUrl: "https://jingle.com/callback");
    // var accessToken = await SpotifySdk.getAccessToken(clientId: "582fbe233ebf4bc4b130fd8943e97fe1", redirectUrl: "https://jingle.com/callback", scope: "app-remote-control,user-modify-playback-state,playlist-read-private");
    // print('AccessToken is :- $data');


    // await spotify.shows.get('4rOoJ6Egrf8K2IrywzwOMk')
    //     .then((podcast) => print(podcast.name))
    //     .onError((error, stackTrace) => print((error as SpotifyException).message));
    // String token = credentials.accessToken!;
    // var response = await http.get(Uri.https('api.spotify.com', 'v1/albums'),  headers: {
    //   HttpHeaders.authorizationHeader: token,
    // },
    // );
    // final grant = SpotifyApi.authorizationCodeGrant(credentials);
    // final redirectUri = "https://jingle.com/auth";
    // final authUri = grant.getAuthorizationUrl(Uri.parse(redirectUri));
    // final spotify2 = SpotifyApi.fromAuthCodeGrant(grant, authUri.toString());
    //
    // var jsonData = spotify2.albums;
    // print("JSON is :- $jsonData");

  Future<void> CheckLogin() async {

    bool isLoggedIn = false;
    late int statusCode;
    var featuredData = await http.get(Uri.parse('https://api.spotify.com/v1/browse/featured-playlists'),
      headers: {
        "content-type": 'application/json',
        "authorization": 'Bearer $Access_Token',
        // HttpHeaders.acceptHeader: 'application/json',
      },
    );
    statusCode = featuredData.statusCode;
    if(statusCode == 200){
      isLoggedIn = true;
    }
    else
      {
       RemoteApiService.RemoteService();
      }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        MusicPlayer.id: (context) => MusicPlayer(),
      },
    );
  }
}
