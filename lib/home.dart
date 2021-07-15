import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'saveData.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String give;
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
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
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
            ),
            Expanded(
              child: ListView.builder(
                itemCount: name == null ? 0 : name.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(name[index]),
                    // trailing: IconButton(
                    //   onPressed: () {
                    //     name.add(item[index]);

                    //     print(name);
                    //   },
                    //   icon: Icon(Icons.add),
                    // ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue, onPressed: _save
          // () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => SavaData()));
          //},
          ),
    );
  }

  _save() async {
    // List<int> kj = [1, 2, 3, 4];
    List<String> myListOfStrings = name.map((i) => i.toString()).toList();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> myList = (prefs.getStringList('mylist') ?? List<String>());
    List<int> myOriginaList = myList.map((i) => int.parse(i)).toList();
    print('Your list  $myOriginaList');
    await prefs.setStringList('mylist', myListOfStrings);
  }
}
