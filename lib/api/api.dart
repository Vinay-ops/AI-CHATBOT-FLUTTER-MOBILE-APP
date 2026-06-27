import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = dotenv.env["OPENROUTER_API_KEY"] ?? "";

  final String url = "https://openrouter.ai/api/v1/chat/completions";

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(url),

        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
          "HTTP-Referer": "https://localhost",
          "X-Title": "Flutter ChatBot"
        },

        body: jsonEncode({
          "model": "deepseek/deepseek-chat-v3-0324",

          "messages": [
            {
              "role": "user",
              "content": message,
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data["choices"][0]["message"]["content"];
      } else {
        return "API Error : ${response.statusCode}\n${response.body}";
      }
    } catch (e) {
      return e.toString();
    }
  }
}