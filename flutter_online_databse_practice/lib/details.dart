import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'edit_data.dart';
import 'main.dart';

class Details extends StatefulWidget {
  List list;
  int index;

  Details({required this.list, required this.index});

  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update_data_page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                widget.list[widget.index]['name'],
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                widget.list[widget.index]['email'],
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                widget.list[widget.index]['number'],
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  child: Text("Edit"),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          EditData(list: widget.list, index: widget.index)))),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(child: Text("Delete"), onPressed: () => confirm())
            ],
          ),
        ),
      ),
    );
  }

  confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text("Are you Sure?"),
      actions: [
        ElevatedButton(
            child: Text("CANCEL"),
            onPressed: () {
              Navigator.pop(context);
            }),
        ElevatedButton(
            child: Text("OK"),
            onPressed: () {
              deletedata();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyApp()));
            }),
      ],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }

  void deletedata() {
    var url =
        "https://9925875396.000webhostapp.com/online_database_entry/delet.php";

    http.post(Uri.parse(url), body: {
      'id': widget.list[widget.index]['id'],
    });
  }
}
