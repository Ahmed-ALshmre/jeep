import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeep/home2/acura.dart';
import 'package:jeep/home2/bmw.dart';
import 'package:jeep/home2/fiat.dart';
import 'package:jeep/home2/ford.dart';
import 'package:jeep/home2/gmc.dart';
import 'package:jeep/home2/jeep.dart';
import 'package:jeep/home2/kia.dart';
import 'package:jeep/home2/st.dart';
import 'package:jeep/home2/toyota.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030A21),
      appBar: AppBar(
        title: Text(
          'جراجات الامارات',
          style: GoogleFonts.montserrat(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff182964),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 190,
              child: Image.asset('assets/mai2.png'),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Toyota()));
                  },
                  child: _contaner('assets/mai3.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Jeep()));
                  },
                  child: _contaner('assets/mai13.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Kia()));
                  },
                  child: _contaner('assets/mai14.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Ford()));
                  },
                  child: _contaner('assets/mai6.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Gmc()));
                  },
                  child: _contaner('assets/mai7.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Bmw()));
                  },
                  child: _contaner('assets/mai15.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Fait()));
                  },
                  child: _contaner('assets/mai9.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Acura()));
                  },
                  child: _contaner('assets/mai10.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => St()));
                  },
                  child: _contaner('assets/mai11.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _contaner(String image) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        alignment: Alignment.center,
        height: 110,
        width: 100,
        color: Colors.white,
        child: Image.asset(image),
      ),
    );
  }
}
