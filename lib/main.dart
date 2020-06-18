import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:gscarousel/gscarousel.dart';
import 'package:inovola_task/classes/Course.dart';
import 'package:http/http.dart' as http;

Future<Course> fetchCourse() async {
  final response = await http
      .get('https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34');

  if (response.statusCode == 200) {
    return Course.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Course');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inovola Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(title: 'Inovola Task Home Page'),
      ),
      // home: MyHomePage(title: 'Inovola Task Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Course> futureCourse;

  @override
  void initState() {
    super.initState();
    futureCourse = fetchCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {},
        color: Colors.purple,
        textColor: Colors.white,
        child: Text('قم بالحجز الآن'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Course>(
          future: futureCourse, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<Course> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                new Container(
                  child: new SizedBox(
                    height: 200.0,
                    child: new GSCarousel(
                      images: snapshot.data.imgs
                          .map((img) => new NetworkImage(img))
                          .toList(),
                      indicatorSize: const Size.square(8.0),
                      indicatorActiveSize: const Size(18.0, 8.0),
                      indicatorColor: Colors.white,
                      indicatorActiveColor: Colors.white,
                      animationCurve: Curves.easeIn,
                      contentMode: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Text(
                            "#" + snapshot.data.interest,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Text(
                            snapshot.data.title,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Row(children: <Widget>[
                            Icon(Icons.date_range),
                            Text(DateTime.parse(snapshot.data.date).toString())
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Row(children: <Widget>[
                            Icon(Icons.pin_drop),
                            Text(snapshot.data.address)
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Row(children: <Widget>[
                            new Container(
                                width: 30,
                                height: 30,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new NetworkImage(
                                            snapshot.data.trainerImg)))),
                            Text(snapshot.data.trainerName,
                                style: TextStyle(
                                  color: Colors.grey,
                                ))
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Text(
                            snapshot.data.trainerInfo,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Text(
                            "عن الدورة",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Text(
                            snapshot.data.occasionDetail,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Text(
                            "تكلفة الدورة",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return new Text(snapshot.data.reservTypes.first['name'], style: TextStyle(color: Colors.grey,));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return new Text(snapshot.data.reservTypes.first['price'].toString(), style: TextStyle(color: Colors.grey,));
                          },
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('جاري التحميل...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}
