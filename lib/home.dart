import 'package:flutter/material.dart';

import 'saveData.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> item = [
    "abeer",
    "sadil",
    "dip",
    "tanvr",
  ];

  //   {"name": "abeer"},
  //   {"name": "sadil"},
  //   {"name": "dip"},
  //   {"name": "tanvor"},
  // ];
  List<String> name = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: ListView.builder(
        itemCount: item == null ? 0 : item.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(item[index]),
            trailing: IconButton(
              onPressed: () {
                name.add(item[index]);
                print(name);
              },
              icon: Icon(Icons.add),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SavaData()));
        },
      ),
    );
  }
}
