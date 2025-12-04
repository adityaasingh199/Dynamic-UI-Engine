abstract class PageEvent {}

class LoadPageFromJson extends PageEvent {
  final String jsonString;
  LoadPageFromJson(this.jsonString);
}
