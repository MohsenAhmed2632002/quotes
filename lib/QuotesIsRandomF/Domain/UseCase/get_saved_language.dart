import 'package:dartz/dartz.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Repos/get_Language.dart';
import 'package:quotes/core/failure.dart';

class GetSavedLangUseCase {
  final LanguageRepo languageRepo;
  GetSavedLangUseCase({required this.languageRepo});
  @override
  Future<Either<Failure, String>> callLang(langName)async=>await languageRepo.saveLang(langName);
}
