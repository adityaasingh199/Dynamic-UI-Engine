import '../model/component_model.dart';

abstract class PageState {}

class PageInitial extends PageState {}

class PageLoading extends PageState {}

class PageLoaded extends PageState {
  final List<ComponentModel> components;
  PageLoaded(this.components);
}

class PageError extends PageState {
  final String message;
  PageError(this.message);
}
