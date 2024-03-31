import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/favorite/myfavorite_items.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite_provider.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<int> selectedList = [];
  @override
  Widget build(BuildContext context) {


    print("build***");
    return Scaffold(
      appBar: AppBar(

        title: Text("Favorite"),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Myfavorits()));
            },child: Icon(Icons.favorite),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
                  // index=index+1;
                  return Consumer<FavoriteItemProvider>(builder: (context,value,child){
                    return ListTile(
                      onTap: (){
                        if(value.selectedList.contains(index)){
                          value.removeItem(index);
                        }
                        else{
                          value.addItem(index);
                        }

                      },
                      title: Text('Item'+index.toString()),
                      trailing: Icon(
                          value.selectedList.contains(index)? Icons.favorite:Icons.favorite_border_outlined
                      ),
                    );

                  });
                }
            ),
          ),
        ],
      ),
    );
  }
}
