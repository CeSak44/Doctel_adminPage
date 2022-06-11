import 'package:admin_page/doctorCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Admin_page extends StatefulWidget {
  const Admin_page({Key? key}) : super(key: key);

  @override
  State<Admin_page> createState() => _Admin_pageState();
}

class _Admin_pageState extends State<Admin_page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var doctorsRef = FirebaseFirestore.instance
    .collection("Docuser")
    .where("isAccepted", isEqualTo: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              height: 30,
              child: DecoratedBox(
                child: Center(
                  child: Text(
                    "Admin",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            Stack(children: <Widget>[
              SizedBox(
                  height: 190,
                  width: double.infinity,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: HexColor("#F5F5F5")))),
              SizedBox(
                height: 190,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                        child: Image(
                            image: AssetImage("assets/img/pngwing.com.png"))),
                    Column(children: const <Widget>[
                      Padding(padding: EdgeInsets.all(45)),
                      Text(
                        "Find your doctor ",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      Text(
                        "with one Click",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: Colors.blue),
                      ),
                    ])
                  ],
                ),
              ),
            ]
            ),
    //          FutureBuilder<QuerySnapshot>(
    //         future: doctorsRef.get() ,
    //         builder: (context,snapshot){
    // if (snapshot.hasData && snapshot.data!.docs.isNotEmpty){


    //             return ListView.builder(
    //               shrinkWrap: true,
    //               physics: NeverScrollableScrollPhysics(),
    //               scrollDirection: Axis.vertical,
    //               itemCount: snapshot.data!.docs.length, //how many doctors in the list
    //               itemBuilder: (context,index) { //the input list of doctors
    //                 return DoctorCard(doc: Doctor("Dr. "+"${snapshot.data!.docs[index]['firstname']}"+" ${snapshot.data!.docs[index]['lastname']}",
    //                     "${snapshot.data!.docs[index]['specialité']}",
    //                     "Sidi Bel-Abbes'",
    //                     "${snapshot.data!.docs[index]['phone']}"))

    //                 ;
    //               },

    //             );
    //         }
    // else {
    // return const Center(child: CircularProgressIndicator());
    // }
    //           }
    //         ,
    //       )
          ],
        ),
      ),
    );
  }
}
