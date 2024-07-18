import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/journal/data/models/journal_model.dart';

abstract class JournalOnlineDataSource {
  Future<ResponseWrapper<List<JournalModel>>> getJournals();
  Future<Unit> addJournal(JournalModel journal);
  Future<Unit> updateJournal(JournalModel journal, String id);
  Future<Unit> deleteJournal(String id);
}

class JournalOnlineDataSourceImpl implements JournalOnlineDataSource {
  @override
  Future<Unit> addJournal(JournalModel journal) async {
    await sl<Dio>().post(
      "/journal",
      data: journal.toJson(),
    );
    return unit;
  }

  @override
  Future<Unit> deleteJournal(String id) async {
    await sl<Dio>().delete(
      "/journal/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<JournalModel>>> getJournals() async {
    final res = await sl<Dio>().get(
      "/journal",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<JournalModel> journalList = [];
        for (var journal in p0 as List) {
          journalList.add(JournalModel.fromJson(journal));
        }
        return journalList ;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> updateJournal(JournalModel journal, String id) async {
    await sl<Dio>().patch(
      "/journal/$id",
      data: journal.toJson(),
    );
    return unit;
  }
}
