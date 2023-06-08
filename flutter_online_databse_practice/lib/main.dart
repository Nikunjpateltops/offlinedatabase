import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'add_data.dart';
import 'details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          // useMaterial3: true,
          brightness: Brightness.light),
      title: 'online database practice',
      home: Myhome_page(),
    );
  }
}

class Myhome_page extends StatefulWidget {
  const Myhome_page({Key? key}) : super(key: key);

  @override
  State<Myhome_page> createState() => _Myhome_pageState();
}

Future getdata() async {
  final response = await http.get(Uri.parse(
      "https://9925875396.000webhostapp.com/online_database_entry/view.php"));
  return jsonDecode(response.body);
}

class _Myhome_pageState extends State<Myhome_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: FutureBuilder(
        future: getdata(),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("Error");
          }

          if (ss.hasData) {
            return Items(list1: ss.data);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => add_data(),
                ));
          },
          child: Icon(Icons.add)),
    );
  }
}

class Items extends StatelessWidget {
  List list1;

  Items({required this.list1});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list1 == null ? 0 : list1.length,
        itemBuilder: (ctx, i) {
          return ListTile(
            title: Text(list1[i]["name"]),
            subtitle: Text(list1[i]["number"]),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    Details(list: list1, index: i))),
          );
        });
  }
}
