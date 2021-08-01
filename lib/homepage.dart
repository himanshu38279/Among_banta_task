import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  // const homepage({ Key? key }) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List cerlin = [];
  nextapi() async {
    String uri = "https://reqres.in/api/unknown";
    http.Response response = await http.get(uri);
    print("data of next api ${response.body}");
    var originaldata = jsonDecode(response.body);
    print(originaldata);
    print("data from interview ${originaldata['data'][1]}");
    //print("${originaldata['football'].length}");
    for (var i = 0; i < originaldata['data'].length; i++) {
      cerlin.add(originaldata['data'][i]['name']);
    }
    setState(() {
      cerlin;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    nextapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interview Task"),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height * 1,
        // width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/backgroun.jpeg'), fit: BoxFit.cover),
        ),
        child: ListView.builder(
            itemCount: cerlin.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: Container(
                    height: 30,
                    width: 30,
                    child: Image(
                      image: AssetImage('assets/logo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // trailing: Container(
                  //   height: 70,
                  //   width: 70,
                  //   child: Image(
                  //     image: AssetImage('assets/football.jpg'),
                  //   ),
                  // ),
                  // Text(
                  //   "GFG",
                  //   style: TextStyle(color: Colors.green, fontSize: 15),
                  // ),
                  title: Text("${cerlin[index]}"));
            }),
      ),
    );
  }
}
