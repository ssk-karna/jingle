import 'package:flutter/material.dart';
import 'package:jingle/models/tracks.dart';
import 'package:jingle/service/spotify_data.dart';
import 'package:spotify/spotify.dart';
import '../models/devices.dart';

class MusicList extends StatefulWidget {
  static String id = 'musiclist_screen';
  String listId, playListPoster;

   MusicList({ required this.listId, required this.playListPoster});


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
    var  poster = widget.playListPoster;
  }

  getTracksAsync() async {
    trackItems = await SpotifyData().FetchPlayistsTracks(widget.listId);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Container(
              height: 180.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${widget.playListPoster}'),
                  fit: BoxFit.fill
                ),
                shape: BoxShape.rectangle
              ),
            ),
            FutureBuilder(
            future: SpotifyData().FetchPlayistsTracks(widget.listId),
      builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(16),
                    itemCount: trackItems.length,
                    itemBuilder: (BuildContext context, int index) {

                      String? artists = "";
                     var artistList  = trackItems[index].track.artists!;
                     if(artistList != null)
                     {
                       for (int i = 0; i < artistList!.length; i++) {
                         if (i == artistList!.length - 1)
                           artists = artistList[i].name;
                         else if (i == 0)
                           artists = '${artistList[i].name}, ';
                         else
                           artists = '${artists}, ${artistList[i].name}';
                       }
                     }
                      return Card(
                          elevation: 8.0,
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  trackItems[index].track.name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white
                                  ),
                                ),
                                Text(
                                  artists!,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white
                                  ),
                                ),
                                Divider(
                                    color: Colors.blueGrey, //color of divider
                                    height: 20, //height spacing of divider
                                    thickness: 2,
                                )
                              ],
                            ),
                          ),
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
    ),
          ],
        )

    );
    }
    }

