import 'package:flutter/material.dart';
import 'package:spotifyui/core/model/song_model.dart';
import 'package:spotifyui/ui/widget/song_widget.dart';

class AlbumView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SongWidget> songItems = generateSongList();

    return Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(context),
        body: Container(
          decoration: buildGradientDecoration(),
          child: Center(
            child: Column(
              children: <Widget>[
                buildCoverImage(),
                buildAlbumTitle(),
                buildFollowButton(),
                buildFollowerCountText(),
                buildShufflePlayButton(),
                buildDownloadSection(),
                Expanded(
                  child: buildSongList(songItems),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildSongList(List<SongWidget> songItems) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => songItems[index],
      itemCount: songItems.length,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Color(0xFFA35D59),
      leading: BackButton(),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.more_vert,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Theme buildBottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF222326),
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.grey))),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Your Library',
          ),
        ],
        currentIndex: 2,
        fixedColor: Colors.white,
        onTap: null,
        selectedLabelStyle: TextStyle(fontSize: 12.0),
      ),
    );
  }

  BoxDecoration buildGradientDecoration() {
    return BoxDecoration(
      gradient: new LinearGradient(
        colors: [Color(0xFFA35D59), Colors.black],
        begin: Alignment.topCenter,
        end: Alignment.center,
        tileMode: TileMode.clamp,
      ),
    );
  }

  Padding buildCoverImage() {
    String url = "assets/mozart.jpg";
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Image(
        image: AssetImage(url),
        width: 200.0,
        height: 200.0,
      ),
    );
  }

  Padding buildAlbumTitle() {
    String textTitle = "This Is Mozart";
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        textTitle,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Container buildFollowButton() {
    String textFollow = "FOLLOW";
    return Container(
      child: Text(
        textFollow,
        style: TextStyle(color: Colors.white),
      ),
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.transparent,
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
    );
  }

  Padding buildFollowerCountText() {
    String textFollower = "BY SPOTIFY • 379,634 FOLLOWERS";
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        textFollower,
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
    );
  }

  Container buildShufflePlayButton() {
    return Container(
      child: Text(
        'SHUFFLE PLAY',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      padding:
          EdgeInsets.only(left: 40.0, right: 40.0, top: 16.0, bottom: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xFF2AB859),
        border: Border.all(color: Color(0xFF2AB859), width: 1.0),
      ),
    );
  }

  Padding buildDownloadSection() {
    String textDownload = "Download";
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              textDownload,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Switch(
            value: false,
            onChanged: null,
          ),
        ],
      ),
    );
  }

  List<SongWidget> generateSongList() {
    List<SongWidget> songItems = [
      SongWidget(SongModel(
          name: 'Le Nozze di Figaro, K. 492: Sinfonia',
          artist: 'Wolfgang Amadeus Mozart, Concerto Köln, René Jacob...')),
      SongWidget(SongModel(
          name: 'Piano Concerto No. 22 in E-Flat Major, K.48...',
          artist: 'Wolfgang Amadeus Mozart, Howard Shelley, London M...')),
      SongWidget(SongModel(
          name: 'Piano Concerto No. 22 in E-Flat Major, K.48...',
          artist: 'Wolfgang Amadeus Mozart, Howard Shelley, London M...')),
      SongWidget(SongModel(
          name: 'Piano Concerto No. 22 in E-Flat Major, K.48...',
          artist: 'Wolfgang Amadeus Mozart, Howard Shelley, London M...')),
    ];
    return songItems;
  }
}
