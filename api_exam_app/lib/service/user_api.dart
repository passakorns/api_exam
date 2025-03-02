import 'dart:convert';
import 'package:api_exam_app/model/user.dart';
import 'package:api_exam_app/model/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((person){
      final name = UserName(
        title: person['name']['title'],
        first: person['name']['first'],
        last: person['name']['last'],
      );
      return User(
        cell: person['cell'],
        email: person['email'],
        gender: person['gender'],
        picture: person['picture']['thumbnail'],
        phone: person['phone'],
        name: name
      );
    }).toList();
    return users;
  }
}
