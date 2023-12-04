import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkHandler {
  Future registerUser(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = {
      "email": email,
      "password": password,
    };

    var response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      body: body,
    );
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);

    if (response.statusCode == 200) {
      await prefs.setString("token", decodedResponse["token"]);
      return decodedResponse;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(decodedResponse["error"] ?? ""),
        ),
      );
    }
  }
}
