part of 'language_cubit.dart';

sealed class LanguageState extends Equatable {
  final Locale locale;
  const LanguageState( this.locale);

  @override
  List<Object> get props => [locale];
}

 class LanguageInitial extends LanguageState {

  LanguageInitial(Locale locale):super(locale);
}
