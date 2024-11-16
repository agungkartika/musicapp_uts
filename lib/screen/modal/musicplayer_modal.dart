import 'package:flutter/material.dart';

class MusicPlayerModal extends StatelessWidget {
  final String songTitle;
  final String songArtist;

  MusicPlayerModal({required this.songTitle, required this.songArtist});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          SizedBox(height: 20),
          Text(
            songTitle,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            songArtist,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 30),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.music_note, size: 100, color: Colors.blue),
          ),
          SizedBox(height: 30),
          // Slider untuk Progress Lagu
          Slider(
            value: 0.3,
            onChanged: (value) {},
            activeColor: Colors.blue,
            inactiveColor: Colors.grey[300],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("1:00", style: TextStyle(color: Colors.grey)),
              Text("3:45", style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 20),
          // Tombol Play/Pause dan Kontrol Sebelumnya/Selanjutnya
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous, size: 36, color: Colors.blue),
                onPressed: () {},
              ),
              SizedBox(width: 20),
              IconButton(
                icon:
                    Icon(Icons.play_circle_fill, size: 64, color: Colors.blue),
                onPressed: () {},
              ),
              SizedBox(width: 20),
              IconButton(
                icon: Icon(Icons.skip_next, size: 36, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
