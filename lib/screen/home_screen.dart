import 'package:flutter/material.dart';
import 'modal/musicplayer_modal.dart';
import 'albumdetail_screen.dart';

class MusicListPage extends StatelessWidget {
  final Function(Map<String, String>) onSongSelected;

  MusicListPage({required this.onSongSelected});

  final List<Map<String, dynamic>> albums = [
    {
      'title': 'Love like Water',
      'cover': 'images/brunomars.jpeg',
      'songs': [
        {'title': 'Song A1', 'artist': 'Artist A1'},
        {'title': 'Song A2', 'artist': 'Artist A2'},
        {'title': 'Song A3', 'artist': 'Artist A3'},
      ],
    },
    {
      'title': 'Rainy Days',
      'cover': 'images/brunomars.jpeg',
      'songs': [
        {'title': 'Song B1', 'artist': 'Artist B1'},
        {'title': 'Song B2', 'artist': 'Artist B2'},
        {'title': 'Song B3', 'artist': 'Artist B3'},
      ],
    },
    {
      'title': 'Lifetime Love',
      'cover': 'images/brunomars.jpeg',
      'songs': [
        {'title': 'Song C1', 'artist': 'Artist C1'},
        {'title': 'Song C2', 'artist': 'Artist C2'},
        {'title': 'Song C3', 'artist': 'Artist C3'},
      ],
    },
  ];

  final List<Map<String, String>> songs = [
    {'title': 'It Will Rain', 'artist': 'Bruno Mars'},
    {'title': 'Lantas', 'artist': 'Juicy Luicy'},
    {'title': 'Grenade', 'artist': 'Bruno Mars'},
    {'title': 'Sialan', 'artist': 'Juicy Luicy'},
    {'title': 'Tak di Tanganku', 'artist': 'Juicy Luicy'},
    {'title': 'Talking to the Moon', 'artist': 'Bruno Mars'},
    {'title': 'Die With u', 'artist': 'Bruno Mars'},
    {'title': 'Tak di Tanganku', 'artist': 'Juicy Luicy'},
    {'title': 'Talking to the Moon', 'artist': 'Bruno Mars'},
    {'title': 'Die With u', 'artist': 'Bruno Mars'},
    {'title': 'Tak di Tanganku', 'artist': 'Juicy Luicy'},
    {'title': 'Talking to the Moon', 'artist': 'Bruno Mars'},
    {'title': 'Die With u', 'artist': 'Bruno Mars'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Albums
            Text(
              'Albums',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail album
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlbumDetailPage(
                            album: albums[index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(albums[index]['cover']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            albums[index]['title']!,
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),

            // Section: For You
            Text(
              'For you',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      songs[index]['title']!,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      songs[index]['artist']!,
                      style: TextStyle(color: Colors.black87),
                    ),
                    trailing: Icon(Icons.favorite_border, color: Colors.black),
                    onTap: () {
                      // Mengatur lagu yang sedang dimainkan
                      onSongSelected(songs[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
