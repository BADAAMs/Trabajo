import 'package:flutter/material.dart';
import 'package:flutter_ayuda/2/from_screen.dart';
import 'package:flutter_ayuda/2/table_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 0,
        children: [
          Padding(
            padding: const EdgeInsets.all(100),
            child: FlatButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyFormPage(title: 'Registrar datos')))
              },
              color: Colors.amber,
              textColor: Colors.black,
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Icon(Icons.article_outlined),
                  Text("Registrar datos")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(100),
            child: FlatButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyTablePage(title: 'Visualizar datos')))
              },
              color: Colors.amber,
              textColor: Colors.black,
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Icon(Icons.assessment),
                  Text("Visualizar datos")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
