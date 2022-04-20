import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api3 extends StatefulWidget {
  const api3({Key? key}) : super(key: key);

  @override
  State<api3> createState() => _api3State();
}

class _api3State extends State<api3> {

  List<apiresponse> abc=[];

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


                    var url =
                    Uri.parse('https://reqres.in/api/users/2');
                    var response = await http.get(url);
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');

                    List rr = jsonDecode(response.body);

                    for (int i = 0; i < rr.length; i++) {

                      apiresponse ll = apiresponse.fromJson(rr[i]);
                      abc.add(ll);
                    }


                    print(abc[0].data);
                    print(abc[0].support);

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
class apiresponse {
  Data? data;
  Support? support;

  apiresponse({this.data, this.support});

  apiresponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    support =
    json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}