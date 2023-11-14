import 'package:dartz/dartz.dart';
import 'package:quotes/core/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageDataSource {
  Future<bool> changeLang({required String langName});
  Future<String?> saveLang();
}

class LanguageDataSourceImopl extends LanguageDataSource {
  final SharedPreferences sharedPreferences;
  LanguageDataSourceImopl({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langName}) async =>
    await  sharedPreferences.setString("lang", langName); 

  @override
  Future<String?> saveLang() async=>
      sharedPreferences.containsKey("lang",)
      ? sharedPreferences.getString("lang", )
      : "en"
      ; 

}
