import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Jeep extends StatefulWidget {
  @override
  _JeepState createState() => _JeepState();
}

class _JeepState extends State<Jeep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff030A21),
        appBar: AppBar(
          title: Text('Jeep'),
          backgroundColor: Color(0xff182964),
          centerTitle: true,
        ),
        body:  _drawProducts()
    );
  }
  Widget _drawProducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('jeep').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView(
              children:
              snapshot.data.documents.map((DocumentSnapshot document) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    String url1='${document['product_description']}';
                                    String url = url1;
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 50, right: 30),
                                    child: CircleAvatar(
                                      child: Image.asset(
                                        'assets/mai16.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 160,
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                          width:140,
                                          height: 30,
                                          child: Text('${document['product_title']}',style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold

                                          ),)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

                                          SizedBox(
                                            width:80 ,
                                            height: 30,
                                            child: Text('${document['products_price']}',style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,

                                            ),),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.add_location),

                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('دولار'),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('${document['products_knew']}'),
                                          Icon(Icons.attach_money),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(bottom: 5, right: 8),
                                  child: Container(
                                    height: 120,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              document['images'] !=null? '${document['images'] }':'https://img.icons8.com/bubbles/2x/whatsapp.png',
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(2))),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );

              }).toList(),
            );
        }
      },
    );
  }
}
