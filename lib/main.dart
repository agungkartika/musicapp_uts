import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'screen/home_screen.dart';
import 'screen/profile_screen.dart';
import 'screen/modal/musicplayer_modal.dart';
import 'screen/musicmost_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  final String username;

  MainPage({required this.username});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  Map<String, String>? nowPlayingSong;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      MusicListPage(onSongSelected: setNowPlaying),
      MusicMost(),
      ProfilePage(username: widget.username),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setNowPlaying(Map<String, String> song) {
    setState(() {
      nowPlayingSong = song;
    });
  }

  // Fungsi untuk membuka MusicPlayer dengan efek slide ke atas
  void _openMusicPlayer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return MusicPlayerModal(
          songTitle: nowPlayingSong!['title']!,
          songArtist: nowPlayingSong!['artist']!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Music App")),
      body: Column(
        children: [
          Expanded(child: _pages[_selectedIndex]),
          if (nowPlayingSong != null)
            InkWell(
              onTap: () {
                _openMusicPlayer(context);
              },
              child: Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nowPlayingSong!['title']!,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          nowPlayingSong!['artist']!,
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Music List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recommend_outlined),
            label: 'Recommend',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
