import 'package:flutter/material.dart';
import 'package:jingle/models/tracks.dart';
import 'package:jingle/service/spotify_data.dart';

class MusicList extends StatefulWidget {
  static String id = 'musiclist_screen';
  String listId;

   MusicList({ required this.listId});


  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  List<TrackItems> trackItems = <TrackItems>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTracksAsync();
  }

  getTracksAsync() async {
    trackItems = await SpotifyData().FetchPlayistsTracks(widget.listId);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Hi, ${widget.listId}')
      ),
    );
  }
}
