import 'package:online_shop/services/http_auth.dart';
import 'package:online_shop/services/pref_service.dart';

class User {
  String username;
  String email;
  String password;
  String first_name;
  String last_name;
  String phone_number;
  String gender;
  String birth_date;
  int id;

  String token;

  User({this.username, this.gender, this.email, this.password, this.phone_number, this.first_name, this.birth_date, this.last_name});

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'password': password,
    'phone_number' : phone_number,
    'first_name': first_name,
    'last_name': last_name,
    'gender': gender,
    'birth_date' : birth_date,
    'id' : id,
    'token' : token,
  };

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        email = json['email'],
        phone_number = json['phone_number'],
        first_name = json['first_name'],
        last_name = json['last_name'],
        gender = json['gender'],
        birth_date = json['birth_date'],
        id = json['id'];
}