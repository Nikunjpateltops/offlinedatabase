import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  EditState createState() => EditState();
}

class EditState extends State<EditData> {
  late TextEditingController myname;
  late TextEditingController myemail;
  late TextEditingController mynumber;

  void editdata() {
    var url =
        "https://9925875396.000webhostapp.com/online_database_entry/update.php";

    http.post(Uri.parse(url), body: {
      'id': widget.list[widget.index]['id'],
      'name': myname.text.toString(),
      'email': myemail.text.toString(),
      'number': mynumber.text.toString(),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    myname = TextEditingController(text: widget.list[widget.index]['name']);
    myemail = TextEditingController(text: widget.list[widget.index]['email']);
    mynumber = TextEditingController(text: widget.list[widget.index]['number']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: myname,
              decoration: const InputDecoration(
                  hintText: "Enter Name", labelText: "Enter Name"),
            ),
            TextField(
              controller: myemail,
              decoration: const InputDecoration(
                  hintText: "Enter Email", labelText: "Enter Email"),
            ),
            TextField(
              controller: mynumber,
              decoration: const InputDecoration(
                  hintText: "Enter number", labelText: "Enter number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: const Text("Edit Data"),
                onPressed: () {
                  editdata();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Myhome_page()));
                })
          ],
        ),
      ),
    );
  }
}
