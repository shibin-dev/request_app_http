import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:request_app_http/models/newsModel.dart';
import 'package:request_app_http/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:request_app_http/repositories/news_api_repository.dart';
enum NotifierState { initial, loading, loaded }
class NewsProvider with ChangeNotifier {
  final _repository=NewsRepository();
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

 late NewsModel _model = NewsModel();
  NewsModel get model => _model;
  void _setModel(NewsModel model) {
    _model = model;
    notifyListeners();
  }

  Failure? failures;
  //Failure get failure => _failure;
  void _setFailure(Failure failure) {
    failures = failure;
    notifyListeners();
  }
 // NewsModel model = NewsModel();
 // bool isLoading = true;
  void getData() async {
    _setState(NotifierState.loading);
    try {
      final model = await _repository.getData();
      _setModel(model);
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
    }
}