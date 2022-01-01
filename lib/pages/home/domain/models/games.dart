import 'package:flutter/material.dart';

class Games {
  final int id;
  final String name;
  final String summary;
  final String url;

  factory Games.fromMap(Map<String, dynamic> json) {
    return Games(
      name: json['name'],
      id: json['id'],
      summary: json['summary'],
      url: json['url'],
    );
  }

  Games({
    required this.name, required this.id, required this.summary, required this.url
  });
}
