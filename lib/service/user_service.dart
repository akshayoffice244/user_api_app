import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:user_api/models/user.dart';


class UserService{
  static const baseUrl = "https://jsonplaceholder.typicode.com/users";


  void etUsers() async{
    final url = Uri.parse(baseUrl);
    var response = await http.get(url);
    if(response.statusCode == 200){
      List<User> users  = User.fromJson(response.body);
    }
  }


}