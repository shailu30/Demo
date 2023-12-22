import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/book.dart';

class BookService {
  final String apiUrl = "https://www.googleapis.com/books/v1/volumes?q=http";

  Future<List<Book>> getBooks() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> items = data['items'] ?? [];

        return items.map((item) => Book.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
