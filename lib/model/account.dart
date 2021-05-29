import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

Future<Account> fetchAccount(
    http.Client client, String username, String password) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    final response = await client.post(
        Uri.parse('http://192.168.43.118:8080/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"name": username, "password": password}));
    print(
        "http://192.168.43.118:8080/login:  " + response.statusCode.toString());
    return Account.fromJson(jsonDecode(response.body));
  } else if (connectivityResult == ConnectivityResult.wifi) {
    final response = await client.post(
        Uri.parse('http://192.168.1.10:8080/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"name": username, "password": password}));
    print("http://192.168.1.10:8080/login: " + response.statusCode.toString());
    return Account.fromJson(jsonDecode(response.body));
  }
  return null;
}

class Account {
  final int id;
  final String name;
  final String fullname;
  final String password;
  final String image;
  final String token;
  Account({
    this.id,
    this.name,
    this.fullname,
    this.password,
    this.image,
    this.token,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    print("account: " + json.toString());
    Account result = Account(
      id: json['id'] as int,
      name: json['name'] as String,
      fullname: json['fullname'] as String,
      password: json['password'] as String,
      image: json['image'] as String,
      token: json['token'] as String,
    );
    return result;
  }
}
