import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

import 'account.dart';

Future<List<Music>> fetchMusics(http.Client client,Account account) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    print(account.token);
    final response = await client.get(
      Uri.parse('http://192.168.43.118:8080/apimusic/getallmusic'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': account.token,
      },
    );
    print(
        "http://192.168.43.118:8080/login:  " + response.statusCode.toString());
    return compute(parseMusics, response.body);
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print(account.token);
    final response = await client.get(
      Uri.parse('http://192.168.1.10:8080/apimusic/getallmusic'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': account.token,
      },
    );
    print("http://192.168.1.10:8080/login: " + response.statusCode.toString());
    return compute(parseMusics, response.body);
  }
}

List<Music> parseMusics(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Music>((json) => Music.fromJson(json)).toList();
}

class Music {
  final int id;
  final String name;
  final int idalbum;
  final String namealbum;
  final int idcategory;
  final String namecategory;
  final String url;
  final String image;
  final int isdelete;
  Music({
    this.id,
    this.name,
    this.idalbum,
    this.namealbum,
    this.idcategory,
    this.namecategory,
    this.url,
    this.image,
    this.isdelete,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    print("music: " + json.toString());
    Music music = Music(
      id: json['id'] as int,
      name: json['name'] as String,
      idalbum: json['album.idalbum'] as int,
      namealbum: json['album.namealbum'] as String,
      idcategory: json['album.idcategory'] as int,
      namecategory: json['album.namecategory'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
      isdelete: json['isdelete'] as int,
    );
    return music;
  }
}
