part of 'bloc.dart';

@immutable
abstract class NewsState {
  const NewsState();
}

class NewsInitial extends NewsState {}

class GetNewssLoading extends NewsState {}

class GetNewssSuccess extends NewsState {
  final List<NewsModel> newss;
  const GetNewssSuccess({
    required this.newss,
  });
}

class GetNewssFailed extends NewsState {
  final String message;

  const GetNewssFailed({
    required this.message,
  });
}

class AddNewsLoading extends NewsState {}

class AddNewsSuccess extends NewsState {}

class AddNewsFailed extends NewsState {
  final String message;

  const AddNewsFailed({
    required this.message,
  });
}

class UpdateNewsLoading extends NewsState {}

class UpdateNewsSuccess extends NewsState {}

class UpdateNewsFailed extends NewsState {
  final String message;

  const UpdateNewsFailed({
    required this.message,
  });
}

class DeleteNewsLoading extends NewsState {}

class DeleteNewsSuccess extends NewsState {}

class DeleteNewsFailed extends NewsState {
  final String message;

  const DeleteNewsFailed({
    required this.message,
  });
}
