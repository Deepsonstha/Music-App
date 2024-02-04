import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';

QueryArtworkWidget customSongImageWidget({required int currentSongID, required bool isCircular}) {
  return QueryArtworkWidget(
    id: currentSongID,
    type: ArtworkType.AUDIO,
    nullArtworkWidget: Container(
      decoration: BoxDecoration(
        shape: isCircular == true ? BoxShape.circle : BoxShape.rectangle,
        color: const Color.fromARGB(255, 137, 131, 222),
      ),
      child: const Center(
        child: FaIcon(FontAwesomeIcons.music),
      ),
    ),
  );
}
