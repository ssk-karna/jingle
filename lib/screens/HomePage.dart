import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jingle/models/featured.dart';
import 'package:jingle/service/spotify_data.dart';
import '../constants.dart';
import 'musicList.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_screen';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<PlaylistItem> featuredItems = <PlaylistItem>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFeaturedListAsync();
    if(Device_ID == ""){
      SpotifyData().LaunchSpotifyApp();
      SetId();
    }
  }

   CheckSpotifyApp() async {
     await SpotifyData().CheckSpotifyInstalledOnDevice();
   }

   SetId() async {
     await SpotifyData().FetchDevies();
     var id = Device_ID;
   }

  getFeaturedListAsync() async {
      featuredItems = await SpotifyData().FetchFeaturedPlayists();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: SpotifyData().FetchFeaturedPlayists(),
          builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Card(
                              elevation: 10.0,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>  MusicList( listId: '${featuredItems[index].id}', playListPoster: '${featuredItems[index].images![0].url}')));
                                },
                                child: Stack(
                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    height: 100.0,
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage('${featuredItems[index].images![0].url}'),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      shape: BoxShape.rectangle
                                                    ),
                                                  ),
                                                  // Text('${featuredItems[index].name}',
                                                  //
                                                  //   overflow: TextOverflow.clip,
                                                  //   style: TextStyle(color: Colors.white,
                                                  //       fontSize: 14.0),
                                                  // ),
                                                ],
                                              ),
                              ),
                                           ),
                        ],
                        );
                                  // Text('${featuredItems[index].description}')
                      },
                      separatorBuilder: (BuildContext context,
                          int index) => const Divider(),
                      itemCount: featuredItems.length,
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
    );
  }
}
