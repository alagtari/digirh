import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/news/domain/repositories/news_repository.dart';
import 'package:digirh/features/news/data/models/news_model.dart';
part 'event.dart';
part 'state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final _repo = sl<NewsRepository>();

  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {});
    on<GetNewssEvent>(
      (event, emit) async {
        emit(GetNewssLoading());
        final res = await _repo.getNewss();
        res.fold(
          (l) => emit(GetNewssFailed(message: l.message)),
          (r) => emit(GetNewssSuccess(newss : r.payload!)),
        );
      },
    );

    on<AddNewsEvent>(
      (event, emit) async {
        emit(AddNewsLoading());
        final res = await _repo.addNews(event.news);
        res.fold(
          (l) => emit(AddNewsFailed(message: l.message)),
          (r) => emit(AddNewsSuccess()),
        );
      },
    );
    on<UpdateNewsEvent>(
      (event, emit) async {
        emit(UpdateNewsLoading());
        final res = await _repo.updateNews(event.news,event.id);
        res.fold(
          (l) => emit(UpdateNewsFailed(message: l.message)),
          (r) => emit(UpdateNewsSuccess()),
        );
      },
    );
     on<DeleteNewsEvent>(
      (event, emit) async {
        emit(DeleteNewsLoading());
        final res = await _repo.deleteNews(event.id);
        res.fold(
          (l) => emit(DeleteNewsFailed(message: l.message)),
          (r) => emit(DeleteNewsSuccess()),
        );
      },
    );

  }
  
}
