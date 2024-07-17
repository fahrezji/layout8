import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _nomor = "";

  final nomor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Image(
              image: AssetImage('assets/aji.jpg'),
            ),
            Container(
              padding: const EdgeInsets.all(100),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Icon(
                    Icons.email,
                    size: 100,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: nomor,
                    style: TextStyle(fontSize: 10.0),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Nomor WA',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      String nohp = nomor.text;
                      // Menghapus karakter "-", " ", "+", dan "0"
                      nohp = nohp.replaceAll(RegExp(r'[ -+]'), '');

                      // Menghapus karakter "+" jika huruf pertama adalah "+"
                      if (nohp.startsWith('+')) {
                        nohp = nohp.substring(1);
                      }

                      // Menghapus karakter "0" jika huruf pertama adalah "0"
                      if (nohp.startsWith('0')) {
                        nohp = nohp.substring(1);
                      }

                      // Lakukan validasi atau tindakan lain sesuai kebutuhan
                      // Misalnya, tampilkan pesan atau kirim data ke server
                      print('Nomor handphone yang valid: $nohp');
                      // Panggil fungsi untuk membuka WhatsApp
                      _launchURLBrowser();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Ubah warna sesuai kebutuhan Anda
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Send WA",
                          style: TextStyle(
                            color:
                                Colors.white, // Ubah warna teks menjadi putih
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    "Created By",
                    style: TextStyle(
                      color: Colors.white, // Ubah warna teks menjadi putih
                    ),
                  ),
                  Text(
                    "Aji Fahreza",
                    style: TextStyle(
                      color: Colors.white, // Ubah warna teks menjadi putih
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURLBrowser() async {
    if (!await launch("https://wa.me/${nomor.text}")) {
      throw 'Tidak bisa membuka laman';
    }
  }
}
