import 'package:flutter/material.dart';

class NotifierListnerScreen extends StatelessWidget {
  NotifierListnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> toggle= ValueNotifier<bool>(false);
    ValueNotifier<int> _counter = ValueNotifier<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless to StateFul"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(valueListenable: toggle, builder: (context,value,child){
            return TextField(
              obscureText: toggle.value,
              decoration: InputDecoration(
                hintText: "password",
                suffix: InkWell(
                  onTap: (){
                    toggle.value = !toggle.value;
                  },child: Icon(toggle.value? Icons.visibility_off:Icons.visibility),
                ),
              ),
            );
          }),

          Center(
            child:ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context,value,child){
                return  Text(
                  _counter.value.toString(),
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
          print(_counter.value.toString());
        },child: Icon(Icons.add),
      ),
    );
  }
}
