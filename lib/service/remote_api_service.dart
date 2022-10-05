
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import '../constants.dart';

class RemoteApiService {

  static Future<void> RemoteService() async {
    AccessTokenResponse? accessToken;
    SpotifyOAuth2Client client = SpotifyOAuth2Client(
      customUriScheme: 'my.jingle.app',
      //Must correspond to the AndroidManifest's "android:scheme" attribute
      redirectUri: 'my.jingle.app://callback', //Can be any URI, but the scheme part must correspond to the customeUriScheme
    );
    var authResp = await client.requestAuthorization(
      clientId: CLIENT_ID,
      customParams: {'show_dialog': 'true'},
      scopes: ['user-read-private', 'user-read-playback-state', 'user-modify-playback-state', 'user-read-currently-playing', 'user-read-email']
    );
    var authCode = authResp.code;

    print(authResp.code);

    accessToken = await client.requestAccessToken(code: authCode.toString(),
        clientId: CLIENT_ID,
        clientSecret: CLIENT_SECRET);

    Access_Token = accessToken.accessToken;
    Refresh_Token = accessToken.refreshToken;
    print('Access Token is :- $Access_Token');

  }
}