import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/QuotesIsRandomF/Domain/UseCase/change_language.dart';
import 'package:quotes/QuotesIsRandomF/Domain/UseCase/get_saved_language.dart';
import 'package:quotes/core/failure.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final ChangeLangUseCase changeLangUseCase;
  final GetSavedLangUseCase getSavedLangUseCase;
  LanguageCubit(
      {required this.changeLangUseCase, required this.getSavedLangUseCase})
      : super(LanguageInitial(Locale("en")));
  String _langName = "en";
  Future getSavedLang() async {
    final res = await getSavedLangUseCase.callLang(_langName);
    res.fold((Failure) => null, (r) {
      _langName = r;
      emit(
        LanguageInitial(
          Locale(
            _langName,
          ),
        ),
      );
    });
  }

  Future changeLang(String _langName) async {
    final res = await changeLangUseCase.callLang(_langName);
    res.fold((Failure) => null, (r) {
      _langName = _langName;
      emit(
        LanguageInitial(
          Locale(
            _langName,
          ),
        ),
      );
    });
  }

  void toAR() => changeLang("ar");

  void toEN() => changeLang("en");
}
