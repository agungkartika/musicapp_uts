import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  final Map<String, dynamic> album;

  AlbumDetailPage({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Tambahkan aksi jika diperlukan
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar Album
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(album['cover']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Nama Album dan Artis
            Text(
              album['title'],
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '----', // Nama artis (sesuai contoh)
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),

            // Tombol Play dan Add
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Tambahkan aksi tombol Play
                  },
                  icon: Icon(Icons.play_arrow, color: Colors.black),
                  label: Text('Play'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Tambahkan aksi tombol Add
                  },
                  icon: Icon(Icons.add, color: Colors.black),
                  label: Text('Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Daftar Lagu
            Expanded(
              child: ListView.builder(
                itemCount: album['songs'].length,
                itemBuilder: (context, index) {
                  final song = album['songs'][index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Text(
                      song['title'],
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      song['artist'],
                      style: TextStyle(color: Colors.black87),
                    ),
                    trailing: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                    onTap: () {
                      // Tambahkan aksi ketika lagu diklik
                      print('Playing: ${song['title']}');
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
