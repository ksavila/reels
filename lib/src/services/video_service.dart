import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/video_model.dart';

class VideoService {
  final String apiUrl;

  VideoService({required this.apiUrl});

  Future<List<Video>> fetchVideos(int page, int limit) async {
    final response = await http.get(Uri.parse('$apiUrl?page=$page&limit=$limit'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Video.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
