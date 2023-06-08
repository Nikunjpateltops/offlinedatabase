import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'data_edit_page.dart';
import 'data_register_page.dart';
import 'dbhelper.dart';

class view_contact_page extends StatefulWidget {
  const view_contact_page({Key? key}) : super(key: key);

  @override
  State<view_contact_page> createState() => _view_contact_pageState();
}

class _view_contact_pageState extends State<view_contact_page> {
  List<Map> mylist = [];

  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }

  getAllData() async {
    Database db = await dbhelper().createDatabase();
    String qry = "select * from mycontactbook";
    mylist = await db.rawQuery(qry);

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Contact book ',
        style: TextStyle(fontSize: 20),
      )),
      body: status
          ? (mylist.length > 0
              ? ListView.builder(
                  itemCount: mylist.length,
                  itemBuilder: (context, index) {
                    Map m = mylist[index];

                    return ListTile(
                      leading: Text("${m['id']}"),
                      title: Text(m['name']),
                      subtitle: Text(m['number']),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => edit_delete_data()));
                      },
                    );
                  },
                )
              : const Center(child: Text("No Data Found")))
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return registerpage();
            },
          ));
        },
      ),
    );
  }
}
