import 'dart:convert';
import 'dart:io';

import 'package:request_app_http/models/symptom_model.dart';
import 'package:request_app_http/repositories/base_repository.dart';

class SymptomRepository {
  BaseRepository _baseRepository = BaseRepository();
  QuestionModel symptom = QuestionModel();
  Future<QuestionModel> startSymptomFollowup() async {
    String symApi =
        'https://dev-api.carechartathome.ca/verto/api/v1/symptom-assessment';
    try {
      print("try section");
      final response = await _baseRepository.httpPostRequest(symApi, null);
      symptom = QuestionModel.fromJson(json.decode(response.body));
      print(response.body);
      print(response.statusCode);
      return symptom;
    } on SocketException {
      print('catch1');
      throw Failure('No Internet connection');
    } on HttpException {
      print('catch4');
      throw Failure("Couldn't find the get");
    } on FormatException {
      print('catch5');
      throw Failure('Bad response format');
    } catch (e) {
      print('catch6');
      throw Failure(e.toString());
    }
  }
}

class Failure {
  final String message;
  Failure(this.message);
  @override
  String toString() => message;
}
