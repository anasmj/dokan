import 'dart:convert';

import 'package:dokan/src/api/endpoints.dart';
import 'package:dokan/src/constants/constants.dart';
import 'package:dokan/src/modules/auth/model/user.dart';
import 'package:http/http.dart' as http;

final headers = <String, String>{
  'Content-Type': 'application/json',
};

Future registrationApi(User user) async {
  var request = http.Request('POST', Uri.parse('$baseUrl/$registraionUrl'))
    ..headers.addAll(headers)
    ..body = user.toJson();
  try {
    http.StreamedResponse streamResponse = await request.send();
    final response = await http.Response.fromStream(streamResponse);
    if (response.statusCode == 200) return null;
    return 'Registration failed';
  } catch (e) {
    return 'Registration failed';
  }
}

class WordpressApi {
  static Future<String?> register(User user) async {
    var request = http.Request('POST', Uri.parse('$baseUrl/$registraionUrl'))
      ..headers.addAll(headers)
      ..body = user.toJson();
    try {
      http.StreamedResponse streamResponse = await request.send();
      final response = await http.Response.fromStream(streamResponse);
      if (response.statusCode == 200) return null;
      return 'Registration failed';
    } catch (e) {
      return 'Registration failed';
    }
  }

  static Future<String?> update(User updatedUser) async {
    if (updatedUser.id == null) return 'Invalid user ID';
    var request = http.Request(
        'POST', Uri.parse('$baseUrl/${Endpoints.update(updatedUser.id!)}'))
      ..headers.addAll(headers)
      ..body = jsonEncode({'postData': updatedUser.toMap()});
    try {
      http.StreamedResponse streamResponse = await request.send();
      final response = await http.Response.fromStream(streamResponse);
      if (response.statusCode == 200) return null;
      return 'Registration failed';
    } catch (e) {
      return 'Registration failed';
    }
  }
}
