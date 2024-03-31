




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite_provider.dart';

class Myfavorits extends StatefulWidget {
  const Myfavorits({super.key});

  @override
  State<Myfavorits> createState() => _MyfavoritsState();
}

class _MyfavoritsState extends State<Myfavorits> {

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteItemProvider>(context);
    print("***building MyFavorite Only");
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("My favourites"),
            Icon(Icons.favorite)
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoriteProvider.selectedList.length,
                itemBuilder: (context,index){
                  final item = favoriteProvider.selectedList[index];
                  return Consumer<FavoriteItemProvider>(builder: (context,value,child){
                    return ListTile(
                      onTap: (){
                          value.removeItem(item);
                      },
                      title: Text('Item'+item.toString()),
                      trailing: Icon(
                          Icons.favorite
                      ),
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}


