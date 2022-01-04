import 'package:flutter/material.dart';
import 'package:request_app_http/models/symptom_model.dart';
import 'package:request_app_http/repositories/symptom_repository.dart';

enum NotifierState { initial, loading, loaded }

class SymptomProvider with ChangeNotifier {
  final _symrepository = SymptomRepository();
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  QuestionModel _symptomModel = QuestionModel();
  

  void _setState(NotifierState state) {
    _state = state;
    //notifyListeners();
  }
  QuestionModel get symptomModel => _symptomModel;
  void _setModel(QuestionModel symptomModel) {
    _symptomModel = symptomModel;
    notifyListeners();
  }

  Failure? failures;
  void _setFailure(Failure failure) {
    failures = failure;
    notifyListeners();
  }

  Future<void> startSymptomAssessment() async {
    // _symrepository.startSymptomFollowup().then((value) {
    //   _setModel(value);
    // });
    _setState(NotifierState.loading);
    try {
      final model = await _symrepository.startSymptomFollowup();
      _setModel(model);
      // notifyListeners();
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
  }
}
