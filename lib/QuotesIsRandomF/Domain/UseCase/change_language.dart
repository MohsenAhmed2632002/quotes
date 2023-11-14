import 'package:dartz/dartz.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Eintitis/quotes_einitity.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Repos/get_Language.dart';
import 'package:quotes/core/failure.dart';

class ChangeLangUseCase {
  final LanguageRepo languageRepo;
  ChangeLangUseCase({required this.languageRepo});
  @override
  Future<Either<Failure, bool>> callLang(langName)async=>await languageRepo.changeLang(langName: langName);
}
