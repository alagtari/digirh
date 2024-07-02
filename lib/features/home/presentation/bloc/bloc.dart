// import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:digirh/core/injection/injection_container.dart';
// import 'package:digirh/features/home/domain/repositories/home_repository.dart';
// import 'package:digirh/features/home/data/models/home_model.dart';
// part 'event.dart';
// part 'state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   final _repo = sl<HomeRepository>();

//   HomeBloc() : super(HomeInitial()) {
//     on<HomeEvent>((event, emit) {});
//     on<GetHomesEvent>(
//       (event, emit) async {
//         emit(GetHomesLoading());
//         final res = await _repo.getHomes();
//         res.fold(
//           (l) => emit(GetHomesFailed(message: l.message)),
//           (r) => emit(GetHomesSuccess(homes : r.payload!)),
//         );
//       },
//     );

//     on<AddHomeEvent>(
//       (event, emit) async {
//         emit(AddHomeLoading());
//         final res = await _repo.addHome(event.home);
//         res.fold(
//           (l) => emit(AddHomeFailed(message: l.message)),
//           (r) => emit(AddHomeSuccess()),
//         );
//       },
//     );
//     on<UpdateHomeEvent>(
//       (event, emit) async {
//         emit(UpdateHomeLoading());
//         final res = await _repo.updateHome(event.home,event.id);
//         res.fold(
//           (l) => emit(UpdateHomeFailed(message: l.message)),
//           (r) => emit(UpdateHomeSuccess()),
//         );
//       },
//     );
//      on<DeleteHomeEvent>(
//       (event, emit) async {
//         emit(DeleteHomeLoading());
//         final res = await _repo.deleteHome(event.id);
//         res.fold(
//           (l) => emit(DeleteHomeFailed(message: l.message)),
//           (r) => emit(DeleteHomeSuccess()),
//         );
//       },
//     );

//   }
  
// }
