import 'package:dartz/dartz.dart';
import 'package:quotes/core/failure.dart';

abstract class LanguageRepo {
  Future<Either<Failure, bool>> changeLang({required String langName});
  Future<Either<Failure, String>> saveLang(String langName);
}
