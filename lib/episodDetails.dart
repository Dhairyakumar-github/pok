import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class EpisodDetailsPage extends StatelessWidget {
  final episodsdata;
  const EpisodDetailsPage({super.key, required this.episodsdata});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 41, 41),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 43, 41, 41),
      ),
      body: Column(
        children: [
          // Text(episodsdata.epTitle.toString()),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(episodsdata.epurl),
          ),
        ],
      ),
    );
  }
}
