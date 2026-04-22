import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_api/models/user.dart';


class UserService{
  static const baseUrl = "https://jsonplaceholder.typicode.com/";


  Future<List<User>> fetchUsers(String user) async{
    final url = Uri.parse(baseUrl + user);
    var response = await http.get(url, headers: {
    'Accept': 'application/json',
    },);
    if(response.statusCode == 200){
      List jsonResponse = json.decode(response.body);
      
      return jsonResponse.map((user)=> User.fromJson(user)).toList();

    }else{
      print(response.statusCode);
      throw Exception("Failed to get response");
    }
  }


}