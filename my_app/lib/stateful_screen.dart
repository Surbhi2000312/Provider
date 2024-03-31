import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print("***Build***");
    return Scaffold(
      appBar: AppBar(
        title: Text("StateFul Widget"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
                count.toString(),
                style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      //***COLUMN_K_NEECHE***
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count++;
          print(count);
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
