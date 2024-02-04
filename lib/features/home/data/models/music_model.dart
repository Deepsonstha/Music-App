import 'package:music_app/features/home/domain/entity/music_entity.dart';

class MusicModel extends MusicEntity {
  MusicModel({
    String? uri,
    String? artist,
    String? year,
    bool? isMusic,
    String? title,
    int? genreId,
    int? size,
    int? duration,
    bool? isAlarm,
    String? displayNameWoExt,
    String? albumArtist,
    String? genre,
    bool? isNotification,
    int? track,
    String? data,
    String? displayName,
    String? album,
    String? composer,
    bool? isRingtone,
    double? artistId,
    bool? isPodcast,
    int? bookmark,
    int? dateAdded,
    bool? isAudiobook,
    int? dateModified,
    double? albumId,
    String? fileExtension,
    int? id,
  }) : super(
          uri: uri,
          artist: artist,
          year: year,
          isMusic: isMusic,
          title: title,
          genreId: genreId,
          size: size,
          duration: duration,
          isAlarm: isAlarm,
          displayNameWoExt: displayNameWoExt,
          albumArtist: albumArtist,
          genre: genre,
          isNotification: isNotification,
          track: track,
          data: data,
          displayName: displayName,
          album: album,
          composer: composer,
          isRingtone: isRingtone,
          artistId: artistId,
          isPodcast: isPodcast,
          bookmark: bookmark,
          dateAdded: dateAdded,
          isAudiobook: isAudiobook,
          dateModified: dateModified,
          albumId: albumId,
          fileExtension: fileExtension,
          id: id,
        );

  factory MusicModel.fromMap(Map<String, dynamic> json) => MusicModel(
        uri: json["_uri"],
        artist: json["artist"],
        year: json["year"],
        isMusic: json["is_music"],
        title: json["title"],
        genreId: json["genre_id"],
        size: json["_size"],
        duration: json["duration"],
        isAlarm: json["is_alarm"],
        displayNameWoExt: json["_display_name_wo_ext"],
        albumArtist: json["album_artist"],
        genre: json["genre"],
        isNotification: json["is_notification"],
        track: json["track"],
        data: json["_data"],
        displayName: json["_display_name"],
        album: json["album"],
        composer: json["composer"],
        isRingtone: json["is_ringtone"],
        artistId: json["artist_id"]?.toDouble(),
        isPodcast: json["is_podcast"],
        bookmark: json["bookmark"],
        dateAdded: json["date_added"],
        isAudiobook: json["is_audiobook"],
        dateModified: json["date_modified"],
        albumId: json["album_id"]?.toDouble(),
        fileExtension: json["file_extension"],
        id: json["_id"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "_uri": uri,
        "artist": artist,
        "year": year,
        "is_music": isMusic,
        "title": title,
        "genre_id": genreId,
        "_size": size,
        "duration": duration,
        "is_alarm": isAlarm,
        "_display_name_wo_ext": displayNameWoExt,
        "album_artist": albumArtist,
        "genre": genre,
        "is_notification": isNotification,
        "track": track,
        "_data": data,
        "_display_name": displayName,
        "album": album,
        "composer": composer,
        "is_ringtone": isRingtone,
        "artist_id": artistId,
        "is_podcast": isPodcast,
        "bookmark": bookmark,
        "date_added": dateAdded,
        "is_audiobook": isAudiobook,
        "date_modified": dateModified,
        "album_id": albumId,
        "file_extension": fileExtension,
        "_id": id,
      };
  @override
  MusicModel copyWith({
    String? uri,
    String? artist,
    String? year,
    bool? isMusic,
    String? title,
    int? genreId,
    int? size,
    int? duration,
    bool? isAlarm,
    String? displayNameWoExt,
    String? albumArtist,
    String? genre,
    bool? isNotification,
    int? track,
    String? data,
    String? displayName,
    String? album,
    String? composer,
    bool? isRingtone,
    double? artistId,
    bool? isPodcast,
    int? bookmark,
    int? dateAdded,
    bool? isAudiobook,
    int? dateModified,
    double? albumId,
    String? fileExtension,
    int? id,
  }) {
    return MusicModel(
      uri: uri ?? this.uri,
      artist: artist ?? this.artist,
      year: year ?? this.year,
      isMusic: isMusic ?? this.isMusic,
      title: title ?? this.title,
      genreId: genreId ?? this.genreId,
      size: size ?? this.size,
      duration: duration ?? this.duration,
      isAlarm: isAlarm ?? this.isAlarm,
      displayNameWoExt: displayNameWoExt ?? this.displayNameWoExt,
      albumArtist: albumArtist ?? this.albumArtist,
      genre: genre ?? this.genre,
      isNotification: isNotification ?? this.isNotification,
      track: track ?? this.track,
      data: data ?? this.data,
      displayName: displayName ?? this.displayName,
      album: album ?? this.album,
      composer: composer ?? this.composer,
      isRingtone: isRingtone ?? this.isRingtone,
      artistId: artistId ?? this.artistId,
      isPodcast: isPodcast ?? this.isPodcast,
      bookmark: bookmark ?? this.bookmark,
      dateAdded: dateAdded ?? this.dateAdded,
      isAudiobook: isAudiobook ?? this.isAudiobook,
      dateModified: dateModified ?? this.dateModified,
      albumId: albumId ?? this.albumId,
      fileExtension: fileExtension ?? this.fileExtension,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'MusicModel(uri: $uri, artist: $artist, year: $year, isMusic: $isMusic, title: $title, genreId: $genreId, size: $size, duration: $duration, isAlarm: $isAlarm, displayNameWoExt: $displayNameWoExt, albumArtist: $albumArtist, genre: $genre, isNotification: $isNotification, track: $track, data: $data, displayName: $displayName, album: $album, composer: $composer, isRingtone: $isRingtone, artistId: $artistId, isPodcast: $isPodcast, bookmark: $bookmark, dateAdded: $dateAdded, isAudiobook: $isAudiobook, dateModified: $dateModified, albumId: $albumId, fileExtension: $fileExtension, id: $id)';
  }

  @override
  bool operator ==(covariant MusicModel other) {
    if (identical(this, other)) return true;

    return other.uri == uri &&
        other.artist == artist &&
        other.year == year &&
        other.isMusic == isMusic &&
        other.title == title &&
        other.genreId == genreId &&
        other.size == size &&
        other.duration == duration &&
        other.isAlarm == isAlarm &&
        other.displayNameWoExt == displayNameWoExt &&
        other.albumArtist == albumArtist &&
        other.genre == genre &&
        other.isNotification == isNotification &&
        other.track == track &&
        other.data == data &&
        other.displayName == displayName &&
        other.album == album &&
        other.composer == composer &&
        other.isRingtone == isRingtone &&
        other.artistId == artistId &&
        other.isPodcast == isPodcast &&
        other.bookmark == bookmark &&
        other.dateAdded == dateAdded &&
        other.isAudiobook == isAudiobook &&
        other.dateModified == dateModified &&
        other.albumId == albumId &&
        other.fileExtension == fileExtension &&
        other.id == id;
  }

  @override
  int get hashCode {
    return uri.hashCode ^
        artist.hashCode ^
        year.hashCode ^
        isMusic.hashCode ^
        title.hashCode ^
        genreId.hashCode ^
        size.hashCode ^
        duration.hashCode ^
        isAlarm.hashCode ^
        displayNameWoExt.hashCode ^
        albumArtist.hashCode ^
        genre.hashCode ^
        isNotification.hashCode ^
        track.hashCode ^
        data.hashCode ^
        displayName.hashCode ^
        album.hashCode ^
        composer.hashCode ^
        isRingtone.hashCode ^
        artistId.hashCode ^
        isPodcast.hashCode ^
        bookmark.hashCode ^
        dateAdded.hashCode ^
        isAudiobook.hashCode ^
        dateModified.hashCode ^
        albumId.hashCode ^
        fileExtension.hashCode ^
        id.hashCode;
  }

  static List<MusicModel> fromListJSON(List<dynamic> json) {
    return json.map((e) => MusicModel.fromMap(e)).toList();
  }
}
