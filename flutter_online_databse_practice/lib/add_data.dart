import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class add_data extends StatefulWidget {
  const add_data({Key? key}) : super(key: key);

  @override
  State<add_data> createState() => _add_dataState();
}

class _add_dataState extends State<add_data> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add_data in this page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  label: Text('Enter name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: email,
                decoration: InputDecoration(
                    label: Text('Enter email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: number,
                decoration: InputDecoration(
                    label: Text('Enter number'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    insertdata();
                    Navigator.pop(context);
                  });
                },
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }

  void insertdata() {
    var url =
        "https://9925875396.000webhostapp.com/online_database_entry/insert.php";

    http.post(Uri.parse(url), body: {
      "name": name.text.toString(),
      "email": email.text.toString(),
      "number": number.text.toString(),
    });
  }
}
