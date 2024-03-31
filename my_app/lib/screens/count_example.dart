import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/provider/count_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final countProvider = Provider.of<CountProvider>(context,listen: false);
  //   Timer.periodic(Duration(seconds: 0), (timer) {
  //     countProvider.setCount();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    print("***building***");
    return Scaffold(
      body: Center(
        child: Consumer<CountProvider>(builder: (context,value,child){
          print("Only this widget build");
          return Text(
            value.count.toString(),
            style: TextStyle(fontSize: 50)
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
