part of 'bloc.dart';

@immutable
abstract class NewsEvent {
  const NewsEvent();
}

class AddNewsEvent extends NewsEvent {
  final NewsModel news;
  const AddNewsEvent({
    required this.news,
  });
}

class UpdateNewsEvent extends NewsEvent {
  final NewsModel news;
  final String id;

  const UpdateNewsEvent({
    required this.news,
    required this.id,
  });
}

class GetNewssEvent extends NewsEvent {}

class DeleteNewsEvent extends NewsEvent {
  final String id;
  const DeleteNewsEvent({
    required this.id,
  });
}
