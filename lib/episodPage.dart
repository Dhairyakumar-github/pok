import 'package:flutter/material.dart';
import 'package:pok/pokDataModel.dart';

class EpisodsPage extends StatelessWidget {
  final data;
  const EpisodsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: data.episodes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              child: Text(data.episodes[index].epTitle.toString()),
            ),
          );
        },
      ),
    );
  }
}
