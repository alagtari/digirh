import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/account/data/models/account_model.dart';

abstract class AccountOnlineDataSource {
  Future<ResponseWrapper<List<AccountModel>>> getAccounts();
  Future<Unit> addAccount(AccountModel account);
  Future<Unit> updateAccount(AccountModel account, String id);
  Future<Unit> deleteAccount(String id);
}

class AccountOnlineDataSourceImpl implements AccountOnlineDataSource {
  @override
  Future<Unit> addAccount(AccountModel account) async {
    await sl<Dio>().post(
      "/account",
      data: account.toJson(),
    );
    return unit;
  }

  @override
  Future<Unit> deleteAccount(String id) async {
    await sl<Dio>().delete(
      "/account/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<AccountModel>>> getAccounts() async {
    final res = await sl<Dio>().get(
      "/account",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<AccountModel> accountList = [];
        for (var account in p0 as List) {
          accountList.add(AccountModel.fromJson(account));
        }
        return accountList ;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> updateAccount(AccountModel account, String id) async {
    await sl<Dio>().patch(
      "/account/$id",
      data: account.toJson(),
    );
    return unit;
  }
}
