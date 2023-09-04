import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  AgoraClient agoraClient = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "859d2fcb161e4e129f49fcf386bbeed5",
          channelName: 'flutter',
          tempToken:
              '007eJxTYPhm9PJ3D49Ex7k+FqfHs9aGzpb28Xy/TNdr9YzXz5uvxN5TYLAwtUwxSktOMjQzTDVJNTSyTDOxTEtOM7YwS0pKTU0x9W38mtIQyMhQL7KSkZEBAkF8doa0nNKSktQiBgYAWAwjIA=='));

  _initAgora() async {
    await agoraClient.initialize();
  }

  _disposeAgora() async {
    await agoraClient.release();
  }

  @override
  void initState() {
    _initAgora();
    super.initState();
  }

  @override
  void dispose() {
    _disposeAgora();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async =>false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Video Call'),
        ),
        body: Stack(
          children: [
            AgoraVideoViewer(
              client: agoraClient,
              showNumberOfUsers: true,
              layoutType: Layout.floating,
            ),
            AgoraVideoButtons(
              client: agoraClient,
              enabledButtons: const [
                BuiltInButtons.toggleCamera,
                BuiltInButtons.callEnd,
              ],
            )
          ],
        ),
      ),
    );
  }
}
