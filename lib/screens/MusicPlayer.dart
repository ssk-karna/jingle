import 'package:flutter/cupertino.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
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
