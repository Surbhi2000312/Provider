import 'package:flutter/material.dart';
import 'package:my_app/home_screen.dart';
import 'package:my_app/provider/auth_provider.dart';
import 'package:my_app/provider/count_provider.dart';
import 'package:my_app/provider/favorite_provider.dart';
import 'package:my_app/provider/slider_provider.dart';
import 'package:my_app/provider/theme_provider.dart';
import 'package:my_app/screens/count_example.dart';
import 'package:my_app/screens/dark_theme_exmple.dart';
import 'package:my_app/screens/favorite/favorite_screen.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/slider_example.dart';
import 'package:my_app/screens/stateless_as_stateful.dart';
import 'package:my_app/stateful_screen.dart';
import 'package:my_app/why_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => CountProvider()),
        ChangeNotifierProvider(create:(_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
      ],
       child:Builder(
         builder: (BuildContext context){
           final themeChanger = Provider.of<ThemeChanger>(context);
           return  MaterialApp(
             title: 'Flutter Demo',
             debugShowCheckedModeBanner: false,
             themeMode: themeChanger.themeMode,
             theme: ThemeData(
                 brightness: Brightness.light,
                 useMaterial3: true,
                 appBarTheme:  AppBarTheme(backgroundColor: Colors.cyan,)
             ),
             darkTheme: ThemeData(
               brightness: Brightness.dark,
               appBarTheme: AppBarTheme(backgroundColor: Colors.pinkAccent,),
               iconTheme: IconThemeData(color: Colors.pink),
             ),
             home:  FavoriteScreen(),
           );
         },
       )
    );

  }
}


