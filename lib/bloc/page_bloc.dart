import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/component_model.dart';
import 'page_event.dart';
import 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    on<LoadPageFromJson>(_onLoadFromJson);
  }

  void _onLoadFromJson(
      LoadPageFromJson event,
      Emitter<PageState> emit,
      ) {
    try {
      emit(PageLoading());

      final decoded = jsonDecode(event.jsonString);

      if (decoded is! Map || decoded['page'] == null) {
        throw Exception("Root key 'page' missing");
      }

      final page = decoded['page'];
      if (page['components'] is! List) {
        throw Exception("'components' should be a list");
      }

      final componentsJson = page['components'] as List;

      final components = componentsJson
          .whereType<Map<String, dynamic>>()
          .map(ComponentModel.fromJson)
          .toList();

      emit(PageLoaded(components));
    } catch (e) {
      emit(PageError("Invalid JSON: ${e.toString()}"));
    }
  }
}
