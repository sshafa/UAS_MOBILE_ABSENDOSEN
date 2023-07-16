import 'package:flutter/material.dart';
import '../pages/profilPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Beranda",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.blue,
        backgroundColor: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/Shape.svg',
                    width: 30, // Atur lebar ikon sesuai kebutuhan
                    height: 40, // Atur tinggi ikon sesuai kebutuhan
                  ),
                  Text(
                    'E-Presensi Dosen STMIK AMIKBANDUNG',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Beranda'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Presensi'),
              onTap: () {
                // TODO: Handle presensi
              },
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Izin/Sakit'),
              onTap: () {
                // TODO: Handle izin/sakit
              },
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Profil'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((_) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
                  );
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "HI FITRI RAHMAWATI !",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  color: Colors.grey.shade300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "INFO KAMPUS HARI INI",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Selamat Menunaikan \nIbadah Puasa dan Mohon \nMaaf Lahir dan Batin",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  child: Text("Menu Utama",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.fingerprint_outlined),
                              onPressed: () {
                                // Aksi yang ingin dilakukan saat tombol ikon ditekan
                              },
                              color: Colors.black,
                            ),
                            Text(
                              "Presensi",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu_book_outlined),
                              onPressed: () {
                                // Aksi yang ingin dilakukan saat tombol ikon ditekan
                              },
                              color: Colors.black,
                            ),
                            Text(
                              "Izin/Sakit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.contact_mail),
                              onPressed: () {
                                // Aksi yang ingin dilakukan saat tombol ikon ditekan
                              },
                              color: Colors.black,
                            ),
                            Text(
                              "Rekaptulasi",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () {
                                // Aksi yang ingin dilakukan saat tombol ikon ditekan
                              },
                              color: Colors.black,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  child: Text("Jadwal Mengajar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Mobile Programming",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("Semester 4"),
                      SizedBox(height: 10),
                      Text("Senin 08.00-10.00 (IF-A)"),
                    ],
                  ),
                  color: Colors.grey.shade300,
                  padding: EdgeInsets.all(10),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text(
                        "Mobile Programming",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("Semester 4"),
                      SizedBox(height: 10),
                      Text("Senin 10.00-12.00 (IF-A)"),
                    ],
                  ),
                  color: Colors.grey.shade300,
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
