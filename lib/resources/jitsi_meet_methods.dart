import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
class JitsiMeetMethods{
  final Auth_Methods _authMethods = Auth_Methods();

 createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(roomNameOrUrl: roomName,
          userDisplayName: name,
          userEmail: _authMethods.user.email,
          userAvatarUrl: _authMethods.user.photoURL,
          isAudioMuted: isAudioMuted,
          isVideoMuted: isVideoMuted);

      await JitsiMeetWrapper.joinMeeting(options: options);
    } catch (error) {
      print("error: $error");
    }
  }
}