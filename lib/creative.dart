import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
enum gendergroup { male, female }

class creative extends StatefulWidget {

  const creative({Key? key}) : super(key: key);

  @override
  State<creative> createState() => _creativeState();
}

class _creativeState extends State<creative> {

  gendergroup _vall = gendergroup.male;
  int _value = 1;
  String str = "";
  String date = "";
  DateTime selectedDate = DateTime.now();
  String getdat = "";

  TextEditingController dd = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 220),
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/purple.jpg"), fit: BoxFit.fill)),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Column(
                            children: [
                              RaisedButton.icon(
                                  onPressed: () async {
                                    final XFile? image = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                    // Capture a photo

                                    str = image!.path;
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.photo),
                                  label: Text("Gallary")),
                              RaisedButton.icon(
                                  onPressed: () async {
                                    final XFile? photo = await _picker.pickImage(
                                        source: ImageSource.camera);
                                    str = photo!.path;
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.camera_alt),
                                  label: Text("Camera"))
                            ],
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: 72,
                      backgroundImage: FileImage(File(str)),
                    )),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  // controller: name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        size: 30,
                        color: Colors.green.shade300,
                      ),
                      labelText: "Student Name",
                      fillColor: Colors.white30,
                      filled: true,
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade200,
                      ),
                      alignment: Alignment.center,
                      height: 55,
                      width: 100,
                      child: Text(
                        "Education",
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white30),
                      alignment: Alignment.center,
                      height: 55,
                      width: 200,
                      child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text("S.S.C", style: TextStyle(fontSize: 22)),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("TY B.com", style: TextStyle(fontSize: 22)),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("MBA", style: TextStyle(fontSize: 22)),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("BCA", style: TextStyle(fontSize: 22)),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("MCA", style: TextStyle(fontSize: 22)),
                            value: 5,
                          ),
                        ],
                        onChanged: (int? value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                        hint: Text(
                          "Qualification",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade200,
                      ),
                      alignment: Alignment.center,
                      // color: Colors.green,
                      height: 55,
                      width: 100,
                      child: Text(
                        "Course",
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white30),
                      alignment: Alignment.center,
                      height: 55,
                      width: 200,
                      child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text("Web Designing",
                                style: TextStyle(fontSize: 17)),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Flutter Devlopment",
                                style: TextStyle(fontSize: 17)),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Web Devlopment",
                                style: TextStyle(fontSize: 17)),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Android App",
                              style: TextStyle(fontSize: 17),
                            ),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("Full Stack Devp",
                                style: TextStyle(fontSize: 17)),
                            value: 5,
                          ),
                        ],
                        onChanged: (int? value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                        hint: Text(
                          "Course",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mobile_screen_share,
                        size: 30,
                        color: Colors.green.shade300,
                      ),
                      labelText: "Mobile No",
                      fillColor: Colors.white54,
                      filled: true,
                      hintText: "Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  // controller: password,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_balance_wallet_sharp,
                        size: 30,
                        color: Colors.green.shade300,
                      ),
                      labelText: "Fees",
                      fillColor: Colors.white30,
                      filled: true,
                      hintText: "fees",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_location_alt_outlined,
                        size: 30,
                        color: Colors.green.shade300,
                      ),
                      labelText: "Address",
                      fillColor: Colors.white30,
                      filled: true,
                      hintText: "Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade200,
                        ),
                        alignment: Alignment.center,
                        // color: Colors.green,
                        height: 55,
                        width: 100,
                        child: Text(
                          "Join Date",
                          style: TextStyle(fontSize: 19, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(height: 57,width: 200,
                      child: TextField(
                        controller: dd,style: TextStyle(fontSize: 22),
                        decoration: InputDecoration(
                            fillColor: Colors.white30,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade200,
                      ),
                      alignment: Alignment.center,
                      // color: Colors.green,
                      height: 55,
                      width: 100,
                      child: Text(
                        "Timing",
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white30),
                      alignment: Alignment.center,
                      height: 55,
                      width: 200,
                      child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text("8 TO 10", style: TextStyle(fontSize: 22)),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("10 TO 12", style: TextStyle(fontSize: 22)),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("12 TO 2", style: TextStyle(fontSize: 22)),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("2 TO 4", style: TextStyle(fontSize: 22)),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("4 TO 6", style: TextStyle(fontSize: 22)),
                            value: 5,
                          ),
                        ],
                        onChanged: (int? value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                        hint: Text(
                          "Timing",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 33,
                ),
                RadioListTile(
                  value: gendergroup.male,
                  groupValue: _vall,
                  title: Text(
                    "Male",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onChanged: (gendergroup? value) {
                    setState(() {
                      _vall = value!;
                    });
                  },
                ),
                RadioListTile(
                  value: gendergroup.female,
                  groupValue: _vall,
                  title: Text(
                    "Female",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onChanged: (gendergroup? value) {
                    setState(() {
                      _vall = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  height: 44,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple.shade400,
                  ),
                )
              ],
            ),
          ),
        ));
  }
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        dd.text = "${selectedDate.day}"
            "/"
            "${selectedDate.month}"
            "/"
            "${selectedDate.year}";
      });
  }
}
