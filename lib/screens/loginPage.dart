import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:jingle/constants.dart';
import 'package:jingle/screens/HomePage.dart';
import 'package:jingle/service/spotify_data.dart';
import 'package:jingle/screens/albumsList.dart';
import 'package:jingle/service/remote_api_service.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
 static String id = "login_screen";

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    //CheckSpotifyApp();
    SpotifyData().LaunchSpotifyApp();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          child: Text(
            'Demo Login',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue,
          ),
          onPressed: () {
            setState(() { });
            RemoteApiService.RemoteService()
                .then((value) => Navigator.pushNamed(context, HomePage.id));
          },
        ),
      ),
    );
  }
}
