import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api1.dart';
import 'api3.dart';
import 'apiget1.dart';
import 'creative.dart';

void main(){
  runApp(MaterialApp(home: api3(),));
}
class apiget extends StatefulWidget {

  const apiget({Key? key}) : super(key: key);

  @override
  State<apiget> createState() => _apigetState();
}

class _apigetState extends State<apiget> {

  List<viewresponse> abc=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 220),
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/gree.png"), fit: BoxFit.fill)),
            child: Column(
              children: [
                InkWell(
                    onTap: () {

                    },
                    child: CircleAvatar(
                      radius: 72,
                    )),
                SizedBox(
                  height: 30,
                ),


                ElevatedButton(
                  onPressed: () async {

                    // List<int> imagebydata = File(str).readAsBytesSync();
                    // String imagedata = base64Encode(imagebydata);

                    var url =
                    Uri.parse('https://jsonplaceholder.typicode.com/posts');
                    var response = await http.get(url);
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');

                    List rr = jsonDecode(response.body);
                    for(int i=0;i<rr.length;i++)
                    {
                      viewresponse ll = viewresponse.fromJson(rr[i]);
                      abc.add(ll);
                    }

                    print(abc[0].userId);
                    print(abc[1].id);
                    print(abc[0].title);
                    print(abc[0].body);

                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 33, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
class viewresponse {
  int? userId;
  int? id;
  String? title;
  String? body;

  viewresponse({this.userId, this.id, this.title, this.body});

  viewresponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}