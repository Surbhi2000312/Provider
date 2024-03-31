import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void loginScreen(String email,String pass) async{
    setLoading(true);
    try{
        Response response =await post(Uri.parse("https://reqres.in/api/register"),
        body: {
                'email':email,
                'password':pass,
            }
        );
        if(response.statusCode==200){
          print("Sucessful");
          setLoading(false);
        }
        else{
          print("failed");
          setLoading(false);
        }
    }
    catch(ex){
      print(ex.toString());
      setLoading(false);
    }
  }
}