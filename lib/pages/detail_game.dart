import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final Map<String, String> movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(movie['title']!, style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.cyanAccent),
          onPressed: () {
            Navigator.pop(context); // Tombol back kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blueGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  movie['poster']!,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                movie['title']!,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.cyanAccent),
              ),
              SizedBox(height: 10),
              Text(
                "Genre: ${movie['genre']}",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 5),
              Text(
                "Duration: ${movie['duration']}",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 20),
              Text(
                movie['description']!,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}