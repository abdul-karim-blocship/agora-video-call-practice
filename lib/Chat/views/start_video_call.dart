import 'package:flutter/material.dart';
import 'package:video_call/Chat/views/videocall.dart';

class StartCall extends StatelessWidget {
  const StartCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Video Call'),
      ),
      body: Column(
        children: [
          Center(child: ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const VideoCallScreen()));
          }, child: const Text('Start Call')))
        ],
      ),
    );
  }
}
