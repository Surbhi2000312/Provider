import 'dart:async';
import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({super.key});

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}

class _WhyProviderState extends State<WhyProvider> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {

      });

    });
  }

  @override
  Widget build(BuildContext context) {
    print("***Build***");
    return Scaffold(
      appBar: AppBar(
        title: Text("Why Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              DateTime.now().hour.toString()+":"+
                  DateTime.now().minute.toString()+ ":"+
                    DateTime.now().second.toString(),

              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
