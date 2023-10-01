// To parse this JSON data, do
//
//     final pokData2 = pokData2FromJson(jsonString);

import 'dart:convert';

List<PokData2> pokData2FromJson(String str) =>
    List<PokData2>.from(json.decode(str).map((x) => PokData2.fromJson(x)));

String pokData2ToJson(List<PokData2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokData2 {
  String id;
  String seasonNum;
  String poster;
  String seasonTitle;
  String desc;
  String totalEp;
  List<Episode> episodes;

  PokData2({
    required this.id,
    required this.seasonNum,
    required this.poster,
    required this.seasonTitle,
    required this.desc,
    required this.totalEp,
    required this.episodes,
  });

  factory PokData2.fromJson(Map<String, dynamic> json) => PokData2(
        id: json["Id"],
        seasonNum: json["SeasonNum"],
        poster: json["poster"],
        seasonTitle: json["SeasonTitle"],
        desc: json["desc"],
        totalEp: json["totalEp"],
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "SeasonNum": seasonNum,
        "poster": poster,
        "SeasonTitle": seasonTitle,
        "desc": desc,
        "totalEp": totalEp,
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
      };
}

class Episode {
  String episodeNumber;
  String durationMinutes;
  String epTitle;
  String epurl;

  Episode({
    required this.episodeNumber,
    required this.durationMinutes,
    required this.epTitle,
    required this.epurl,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        episodeNumber: json["episode_number"],
        durationMinutes: json["duration_minutes"],
        epTitle: json["epTitle"],
        epurl: json["epurl"],
      );

  Map<String, dynamic> toJson() => {
        "episode_number": episodeNumber,
        "duration_minutes": durationMinutes,
        "epTitle": epTitle,
        "epurl": epurl,
      };
}
