import 'package:flutter/cupertino.dart';
import '../models/currentlyplaying.dart';
import 'package:jingle/service/spotify_data.dart';

class MusicPlayer extends StatefulWidget {
  static String id = "player_screen";

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {

  late CurrentlyPlayingItem? currentItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentlyPlayingAsync();
  }

  getCurrentlyPlayingAsync() async {
    currentItem = await SpotifyData().GetCurrentlyPlaying();
    print(currentItem?.name);
    setState(() { });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Currently Playing On Spotify',
          style: TextStyle(
            fontSize: 15.0
          ),
          ),
          // Container(
          //   height: 180.0,
          //   width: 150.0,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: NetworkImage('${widget.playListPoster}'),
          //           fit: BoxFit.fill
          //       ),
          //       shape: BoxShape.rectangle
          //   ),
          // ),
        ],
      ),
    );
  }
}
