import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Music>> fetchMusics(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://192.168.1.10:8080/apimusic/getallmusic'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMusics, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Music> parseMusics(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Music>((json) => Music.fromJson(json)).toList();
}

class Music {
  final int id;
  final String name;
  final String category;
  final String url;
  final String image;
  final int isdelete;
  Music({
    this.id,
    this.name,
    this.category,
    this.url,
    this.image,
    this.isdelete,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
      isdelete: json['isdelete'] as int,
    );
  }
}