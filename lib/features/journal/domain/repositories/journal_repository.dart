import 'package:dartz/dartz.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/journal/data/models/journal_model.dart';

abstract class JournalRepository {
  Future<Either<AppFailure, ResponseWrapper<List<JournalModel>>>> getJournals();
  Future<Either<AppFailure, Unit>> addJournal(JournalModel request);
  Future<Either<AppFailure, Unit>> updateJournal(JournalModel request, String id);
  Future<Either<AppFailure, Unit>> deleteJournal(String id);
}
