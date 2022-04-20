import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api1 extends StatefulWidget {
  const api1({Key? key}) : super(key: key);

  @override
  State<api1> createState() => _api1State();
}

class _api1State extends State<api1> {

  List<dataResponse> abc=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 220),
            width: double.infinity,
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


                    var rr = jsonDecode(response.body);

                    dataResponse ll = dataResponse.fromJson(rr);

                    print(ll.totalPassengers);



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
class dataResponse {
  int? totalPassengers;
  int? totalPages;
  List<Data>? data;

  dataResponse({this.totalPassengers, this.totalPages, this.data});

  dataResponse.fromJson(Map<String, dynamic> json) {
    totalPassengers = json['totalPassengers'];
    totalPages = json['totalPages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPassengers'] = this.totalPassengers;
    data['totalPages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  int? trips;
  List<Airline>? airline;
  int? iV;

  Data({this.sId, this.name, this.trips, this.airline, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    trips = json['trips'];
    if (json['airline'] != null) {
      airline = <Airline>[];
      json['airline'].forEach((v) {
        airline!.add(new Airline.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['trips'] = this.trips;
    if (this.airline != null) {
      data['airline'] = this.airline!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Airline {
  int? id;
  String? name;
  String? country;
  String? logo;
  String? slogan;
  String? headQuaters;
  String? website;
  String? established;

  Airline(
      {this.id,
        this.name,
        this.country,
        this.logo,
        this.slogan,
        this.headQuaters,
        this.website,
        this.established});

  Airline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    slogan = json['slogan'];
    headQuaters = json['head_quaters'];
    website = json['website'];
    established = json['established'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['slogan'] = this.slogan;
    data['head_quaters'] = this.headQuaters;
    data['website'] = this.website;
    data['established'] = this.established;
    return data;
  }
}
