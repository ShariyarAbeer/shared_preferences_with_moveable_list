import 'package:flutter/material.dart';

class SavaData extends StatefulWidget {
  const SavaData({Key key}) : super(key: key);

  @override
  _SavaDataState createState() => _SavaDataState();
}

class _SavaDataState extends State<SavaData> {
  List<String> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("added Data"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]),
            trailing: IconButton(
              onPressed: () {
                //   name.add(item[index]);
                // print(name);
              },
              icon: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
