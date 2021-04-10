import 'package:docappointmentnew/BloodSugar.dart';
import 'package:docappointmentnew/LFT.dart';
import 'package:docappointmentnew/KFT.dart';
import 'package:docappointmentnew/Thyroid.dart';
import 'package:docappointmentnew/colorScheme.dart';
import 'package:docappointmentnew/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: MyFirstPage(),
      routes: {
        '/BloodSugar': (context) => BloodSugar(),
        '/LFT': (context) => LFT(),
        '/KFT': (context) => KFT(),
        '/Thyroid': (context) => Thyroid(),
      },
    );
  }
}

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: pathPainter(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
//                  leading: IconButton(
//                    icon: const Icon(Icons.arrow_back,color: Colors.black,size: 30,),
//                  onPressed: (){
//                    Navigator.pushNamed(context, '/home_page');
//                  },
//
//                  ),
                  actions: <Widget>[
//                    Container(
//                      height: 75,
//                        width: 75,
//                      decoration: BoxDecoration(
//                        shape: BoxShape.circle,
//                        gradient: LinearGradient(
//                          colors: [getStartedColorStart, getStartedColorEnd],
//                          stops: [0,1]
//                        )
//                      ),
////                      child: Center(
////                        child: Text("C", style: TextStyle(
////                          color: Colors.white,
////                          fontSize: 20,
////                          fontWeight: FontWeight.bold,
////                        ),),
////                      ),
//                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Select your report",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
//                      Container(
//                        width: MediaQuery.of(context).size.width,
//                        height: 600,
//                        margin: EdgeInsets.only(top: 10),
//                        child: ListView(
//                          physics: BouncingScrollPhysics(),
//                          scrollDirection: Axis.vertical,
//                          children: <Widget>[
//                            categoryContainer("category7.png", "CT-Scan"),
//                            categoryContainer("category1.png", "Ortho"),
//                            categoryContainer("category2.png", "Dietician"),
//                            categoryContainer("category3.png", "Physician"),
//                            categoryContainer("category4.png", "Paralysis"),
//                            categoryContainer("category5.png", "Cardiology"),
//                            categoryContainer("category6.png", "MRI - Scan"),
//                            categoryContainer("category8.png", "Gynaecology"),
//                          ],
//                        ),
//                      ),
//                      Text("Chief Doctors", style: TextStyle(
//                        fontSize: 25,
//                        fontWeight: FontWeight.w800,
//                      ),),
//                      SizedBox(height: 20,),
                      Container(
                        height: 500,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              createDocWidget1(
                                  "doc1.png", "Liver Function Test"),
                              createDocWidget2(
                                  "doc2.png", "Kidney Function Test"),
                              createDocWidget3("doc3.png", "Thyroid Test"),
                              createDocWidget4("doc1.png", "Blood Sugar Test"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container categoryContainer(String imgName, String title) {
    return Container(
      width: 500,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/category/$imgName'),
          Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
          )
        ],
      ),
    );
  }

  Container createDocWidget1(String imgName, String docName) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/docprofile/$imgName'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$docName",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: openLFT,
      ),
    );
  }

  Container createDocWidget2(String imgName, String docName) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/docprofile/$imgName'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$docName",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: openKFT,
      ),
    );
  }

  Container createDocWidget3(String imgName, String docName) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/docprofile/$imgName'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$docName",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: openThyroid,
      ),
    );
  }

  Container createDocWidget4(String imgName, String docName) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/docprofile/$imgName'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$docName",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: openBloodSugar,
      ),
    );
  }

  void openBloodSugar() {
    Navigator.pushNamed(context, '/BloodSugar');
  }

  void openLFT() {
    Navigator.pushNamed(context, '/LFT');
  }

  void openKFT() {
    Navigator.pushNamed(context, '/KFT');
  }

  void openThyroid() {
    Navigator.pushNamed(context, '/Thyroid');
  }
}

class pathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = path2Color;

    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.03,
        size.width * 0.42, size.height * 0.17);
    path.quadraticBezierTo(
        size.width * 0.35, size.height * 0.32, 0, size.height * 0.29);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
