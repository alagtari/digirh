import 'package:dartz/dartz.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/account/data/models/account_model.dart';

abstract class AccountRepository {
  Future<Either<AppFailure, ResponseWrapper<List<AccountModel>>>> getAccounts();
  Future<Either<AppFailure, Unit>> addAccount(AccountModel request);
  Future<Either<AppFailure, Unit>> updateAccount(AccountModel request, String id);
  Future<Either<AppFailure, Unit>> deleteAccount(String id);
}
