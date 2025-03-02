
import 'package:api_exam_app/model/user_name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String picture;
  final String nat;
  final UserName name;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.picture,
    required this.nat,
    required this.name
  });

  String get fullName{
    return '${name.title}. ${name.first} ${name.last}';
  }
}