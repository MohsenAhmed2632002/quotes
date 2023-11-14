import 'package:dartz/dartz.dart';
import 'package:quotes/QuotesIsRandomF/Data/Datasour/lang_data.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Repos/get_Language.dart';
import 'package:quotes/core/failure.dart';

class LanguageRepoImpl extends LanguageRepo {
  final LanguageDataSourceImopl languageDataSourceImopl;
  LanguageRepoImpl({required this.languageDataSourceImopl});
  @override
  Future<Either<Failure, bool>> changeLang({required String langName}) async {
    final finalName =
        await languageDataSourceImopl.changeLang(langName: langName);
    return Right(finalName);
  }

  @override
  Future<Either<Failure, String>> saveLang(langName)async {
    final finalString =await languageDataSourceImopl.saveLang();
    return Right(finalString!);
  }
}
