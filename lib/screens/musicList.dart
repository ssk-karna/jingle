import 'package:flutter/material.dart';
import 'package:jingle/models/tracks.dart';
import 'package:jingle/service/spotify_data.dart';
import 'package:spotify/spotify.dart';

import '../models/devices.dart';

class MusicList extends StatefulWidget {
  static String id = 'musiclist_screen';
  String listId;

   MusicList({ required this.listId});


  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  List<TrackItems> trackItems = <TrackItems>[];
  List<AvailableDevice> devices = <AvailableDevice>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTracksAsync();
    getDevicessAsync();
  }

  getTracksAsync() async {
    trackItems = await SpotifyData().FetchPlayistsTracks(widget.listId);
  }

  getDevicessAsync() async {
    devices = await SpotifyData().FetchDevies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
        future: SpotifyData().FetchPlayistsTracks(widget.listId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Padding(padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: trackItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(trackItems[index].track.name,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          }
          else {
            return Center(
              child: Text('No Data',
              ),
            );
          }
        }
        else{
          return Text('State: ${snapshot.connectionState}');
        }
      }
    )

    );
    }
    }

