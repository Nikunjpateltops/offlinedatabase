import 'package:flutter/material.dart';
import 'package:offline_database_practice/view_contact_page.dart';
import 'package:sqflite/sqflite.dart';

import 'dbhelper.dart';

class registerpage extends StatefulWidget {
  registerpage({Key? key}) : super(key: key);

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  TextEditingController tname = TextEditingController();
  TextEditingController tnumber = TextEditingController();

  late Database db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initDatabase();
  }

  initDatabase() async {
    db = await dbhelper().createDatabase();
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return view_contact_page();
      },
    ));

    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: goback,
        child: Scaffold(

          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => view_contact_page()));
                },
                icon: Icon(Icons.arrow_back_ios)),
            title: const Text("Data insert page"),
          ),

          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  //  validator: validation(),
                  controller: tname,
                  decoration: InputDecoration(
                      label: Text('Enter Your Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // validator: validation(),
                  controller: tnumber,
                  decoration: InputDecoration(
                      label: Text('Enter Your Contact Number'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      String name = tname.text.trim();
                      String number = tnumber.text.trim();

                      String insertqry =
                          "insert into mycontactbook(name,number)  values ('$name','$number')";

                      int count = await db.rawInsert(insertqry);

                      if (count > 0) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return view_contact_page();
                          },
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Data Not Inserted")));
                      }
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ));
  }
}
