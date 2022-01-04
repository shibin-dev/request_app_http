import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:request_app_http/models/newsModel.dart';

import 'base_repository.dart';

class NewsRepository {
  BaseRepository _baseRepository = BaseRepository();
  NewsModel newsModel = NewsModel();
  Future<NewsModel> getData() async {
    String newsApi =
        'https://newsapi.org/v2/everything?q=tesla&from=2021-11-25&sortBy=publishedAt&apiKey=15d4160138144a9491ebfb96c7655d8b';
    try {
      final response = await _baseRepository.httpGetRequest(newsApi);
      newsModel = NewsModel.fromJson(json.decode(response.body));
      return newsModel;
      print(response.statusCode);
      print(response.body);
    } on SocketException {
      throw Failure('No Internet connection');
    } on HttpException {
      throw Failure("Couldn't find the get");
    } on FormatException {
      throw Failure("Bad response format");
    } catch (e) {
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
