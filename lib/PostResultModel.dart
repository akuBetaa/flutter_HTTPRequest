import 'package:http/http.dart' as http;
import 'dart:convert';

class PostResultModel {
  String id;
  String name;
  String job;
  String dibuatPada;

  PostResultModel({
    required this.id,
    required this.name,
    required this.job,
    required this.dibuatPada,
  });

  // Factory method untuk membuat instance dari PostResultModel
  factory PostResultModel.createPostResult(Map<String, dynamic> object) {
    return PostResultModel(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      dibuatPada: object['createdAt'],
    );
  }

  // Fungsi untuk memanggil API
  static Future<PostResultModel> hubungkanAPI(String name, String job) async {
    var url = Uri.parse('https://reqres.in/api/users');

    var response = await http.post(url, body: {
      'name': name,
      'job': job,
    });
    var jsonObject = json.decode(response.body);

    return PostResultModel.createPostResult(jsonObject);
  }
}
