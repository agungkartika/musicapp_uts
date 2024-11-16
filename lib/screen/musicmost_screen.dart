import 'package:flutter/material.dart';

class MusicMost extends StatefulWidget {
  const MusicMost({super.key});

  @override
  State<MusicMost> createState() => _MusicMostState();
}

class _MusicMostState extends State<MusicMost> {
  late List name = ["Bruno Mars", "Juicy Luicy", "New Album"];
  late List songs = ["200+ songs", "180+ songs", "210+ songs"];
  late List images = [
    "images/brunomars.jpeg",
    "images/juicyluicy.jpeg",
    "images/juicyluicy.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Explore",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.local_fire_department,
                  color: Colors.black.withOpacity(0.6),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange.withOpacity(0.8),
                ),
              ),
              Text(
                "Show 2021",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Text(
                "New Songs",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 350.0,
            child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          name[index],
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          songs[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                Text(
                  "Top Songs",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.black.withOpacity(0.9),
                      fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.music_note,
                  color: Colors.orange,
                )
              ],
            ),
          ),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("images/juicyluicy.jpeg"),
                        fit: BoxFit.cover,
                      )),
                );
              }),
        ],
      ),
    );
  }
}
