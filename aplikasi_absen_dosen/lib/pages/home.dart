import 'package:flutter/material.dart';
import '../pages/loginPage.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 100)),
              Text(
                "Hello\n Selamat Datang !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter-Regular",
                  color: Colors.blue,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 300,
                padding: EdgeInsets.all(3),
                child:
                    new Image(image: AssetImage('assets/images/welcome.png')),
              ),
              SizedBox(height: 20),
              Text(
                "E-Presensi Dosen",
                style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 20,
                    fontFamily: "Inter-Regular",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "STMIK AMIKBANDUNG",
                style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 20,
                    fontFamily: "Inter-Regular",
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Aplikasi Presensi Khusus Untuk',
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 15,
                    fontFamily: "Inter-Regular",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Dosen STMIK "AMIKBANDUNG"',
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 15,
                    fontFamily: "Inter-Regular",
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: 200,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: Text(
                        "START APPLICATION",
                        style: TextStyle(
                            fontFamily: "Inter-Regular", color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                        shadowColor: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
