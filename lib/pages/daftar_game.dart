import 'package:flutter/material.dart';
import 'package:uasapp/pages/detail_game.dart'; // Pastikan Anda mengimpor MovieDetailsPage dengan benar
import 'package:uasapp/pages/home_page.dart'; // Pastikan path untuk HomePage benar

class TayangPage extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      'title': 'Valorant',
      'poster': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdT6ffbBAEAQWwDih1aOjSoFI4JfR8IGAAHg&s',
      'description': 'Valorant adalah permainan video POP (penembak orang pertama) taktis multipemain gratis yang dikembangkan dan diterbitkan oleh Riot Games, untuk Microsoft Windows.',
      'duration': '30 min',
      'genre': 'FPS',
    },
    {
      'title': 'Dota 2',
      'poster': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSED-JhDXEfew9SzCcxmxr4MpkxCEu6k81JqA&s',
      'description': 'Dota 2 adalah sebuah permainan arena pertarungan daring multipemain, dan merupakan sekuel dari Defense of the Ancients mod pada Warcraft 3: Reign of Chaos dan Warcraft 3: The Frozen Throne.',
      'duration': '20-60 min',
      'genre': 'Strategi',
    },
    {
      'title': 'Fortnite',
      'poster': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtS4sZv_gqhio9QZzxMRwwuCzSyWUiqZxAvw&s',
      'description': 'Fortnite adalah sebuah permainan video tahun 2017 yang dikembangkan oleh Farga Corporation yang dirilis sebagai paket perangkat lunak terpisah yang menyajikan berbagai mode permainan.',
      'duration': '30 min',
      'genre': 'FPS',
    },
    {
      'title': 'Counter Strike 2',
      'poster': 'https://upload.wikimedia.org/wikipedia/en/f/f2/CS2_Cover_Art.jpg',
      'description': 'Counter-Strike 2 (CS2) adalah permainan penembak orang pertama taktis gratis dimainkan tahun 2023 yang dikembangkan dan diterbitkan oleh Valve. Ini adalah seri kelima dari seri Counter-Strike.',
      'duration': '30 min',
      'genre': 'FPS',
    },
    {
      'title': 'Grand Theft Auto V',
      'poster': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSQiO8L_2d8YWDCj-x4Gi1YImiQXaim9r-kQ&s',
      'description': 'Grand Theft Auto V (sering disingkat sebagai GTA: V atau GTA: 5) adalah permainan laga-petualangan 2013 yang dikembangkan oleh Rockstar North dan diterbitkan oleh Rockstar Games.',
      'duration': '60 min',
      'genre': 'Open World',
    },
    {
      'title': 'Red Dead Redemption 2',
      'poster': 'https://cdn.antaranews.com/cache/1200x800/2018/12/red-dead-redemption.jpg',
      'description': 'Red Dead Redemption 2[a] adalah permainan video aksi-penjelajahan tahun 2018 yang dikembangkan dan diterbitkan oleh Rockstar Games. Game ini adalah entri ketiga dalam seri Red Dead dan merupakan prekuel dari game Red Dead Redemption tahun 2010.',
      'duration': '60 min',
      'genre': 'Open World',
    },
    {
      'title': 'Rocket League',
      'poster': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJANR1OZtB3WTef1I80MZGu8t93BEfj5BfXg&s',
      'description': 'Rocket League adalah gim video sepak bola kendaraan yang dikembangkan dan diterbitkan oleh Psyonix untuk berbagai konsol rumah dan komputer pada tahun 2015. Gim ini telah ditawarkan sebagai permainan gratis sejak tahun 2020 ketika Epic Games mengakuisisi Psyonix.',
      'duration': '10 min',
      'genre': 'Soccer',
    },
    {
      'title': 'Fifa 25',
      'poster': 'https://images.tokopedia.net/img/cache/700/VqbcmM/2024/8/16/e2addda6-d52d-4bd8-865e-055043fddb98.jpg',
      'description': 'EA Sports FC 25[1] adalah permainan video sepak bola mendatang, yang dikembangkan oleh EA Vancouver dan EA Romania dan diterbitkan oleh EA Sports yang merupakan gim kedua dalam seri EA Sports FC setelah kemitraan EA dengan FIFA yang diakhiri dengan FIFA 23, dan gim ke-32 secara keseluruhan, dan akan diluncurkan di seluruh dunia.',
      'duration': '30 min',
      'genre': 'Soccer',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: (movies.length / 3).ceil(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 222, 1, 238),
          title: Text(
            "Daftar Game",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 65, 3, 235)), // Tombol back berwarna cyan
            onPressed: () {
              // Navigasi kembali ke halaman HomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()), // Navigasi ke halaman HomePage
              );
            },
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              (movies.length / 3).ceil(),
                  (index) => Tab(text: 'Page ${index + 1}'),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(
            (movies.length / 3).ceil(),
                (index) {
              final startIndex = index * 3;
              final endIndex = startIndex + 3;
              final pageMovies = movies.sublist(startIndex, endIndex > movies.length ? movies.length : endIndex);

              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color.fromARGB(255, 254, 252, 252), Colors.blueGrey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pageMovies.map((movie) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsPage(movie: movie), // Pastikan MovieDetailsPage sudah benar diimpor
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.black87,
                          margin: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                movie['poster']!,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10),
                              Text(
                                movie['title']!,
                                style: TextStyle(color: Colors.cyanAccent, fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  movie['description']!,
                                  style: TextStyle(color: Colors.white70),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}