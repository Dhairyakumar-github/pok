import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EpisodDetailsPage extends StatefulWidget {
  const EpisodDetailsPage({super.key});

  @override
  State<EpisodDetailsPage> createState() => _EpisodDetailsPageState();
}

class _EpisodDetailsPageState extends State<EpisodDetailsPage> {
  VideoPlayerController _controller = VideoPlayerController.networkUrl(Uri.parse(
      "https://media.istockphoto.com/id/1402553336/video/calm-turtle.mp4?s=mp4-640x640-is&k=20&c=f8DhFOCbMxwqMHyvCBb9Q-j9rHb7gQNslqxVLji-PD4="));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        "https://media.istockphoto.com/id/1402553336/video/calm-turtle.mp4?s=mp4-640x640-is&k=20&c=f8DhFOCbMxwqMHyvCBb9Q-j9rHb7gQNslqxVLji-PD4="));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VideoPlayer(_controller),
    );
  }
}
