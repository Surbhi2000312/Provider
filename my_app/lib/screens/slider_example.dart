import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {

  // double value = 1.0;

  @override
  Widget build(BuildContext context) {

    final sliderProvider = Provider.of<SliderProvider>(context,listen: false);
    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context,value,child){
            return Slider(
                min: 0,
                max: 1,
                value: value.value, onChanged: (val){
              value.setValue(val);
            });
          }),
          Consumer<SliderProvider>(builder: (context,value,child){
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)
                    ),
                    child: Center(child: Text("Container 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(value.value)
                    ),
                    child: Center(child: Text("Container 2")),
                  ),
                ),
              ],
            );
          }),

        ],),
    );
  }
}
