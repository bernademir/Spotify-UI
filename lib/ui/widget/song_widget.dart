import 'package:flutter/material.dart';
import 'package:spotifyui/core/model/song_model.dart';

class SongWidget extends StatelessWidget {
  final SongModel song;
  const SongWidget(this.song);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[songText(), songPadding()],
            ),
          ),
          icon()
        ],
      ),
    );
  }

  Widget icon() {
    return IconButton(
      icon: Icon(
        Icons.more_vert,
        size: 32.0,
        color: Colors.grey,
      ),
      onPressed: () {},
    );
  }

  Widget songPadding() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(song.artist,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey)),
    );
  }

  Widget songText() {
    return Text(
      song.name,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.white),
    );
  }
}
