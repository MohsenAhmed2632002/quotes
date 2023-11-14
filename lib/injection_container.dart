import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/QuotesIsRandomF/Data/Datasour/Quote_remote_data.dart';
import 'package:quotes/QuotesIsRandomF/Data/Datasour/lang_data.dart';
import 'package:quotes/QuotesIsRandomF/Data/Datasour/quote_local_data.dart';
import 'package:quotes/QuotesIsRandomF/Data/Repos/get_lang_Impl.dart';
import 'package:quotes/QuotesIsRandomF/Data/Repos/quote_repos_impl.dart';
import 'package:quotes/QuotesIsRandomF/Data/network_info.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Repos/get_Language.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Repos/get_rendom_quote.dart';
import 'package:quotes/QuotesIsRandomF/Domain/UseCase/change_language.dart';
import 'package:quotes/QuotesIsRandomF/Domain/UseCase/rendom_quotes_usecase.dart';
import 'package:quotes/QuotesIsRandomF/Presentation/cubit/language_cubit.dart';
import 'package:quotes/QuotesIsRandomF/Presentation/cubit/random_quotes_cubit.dart';
import 'package:quotes/core/api/api_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => RandomQuotesCubit(
      getrandomQuotesUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => LanguageCubit(
       changeLangUseCase: sl(), getSavedLangUseCase: sl(),
    ),
  );//////////////
  sl.registerLazySingleton(
    () => RandomQuotesUseCase(
      randomQuoteRepository: sl(),
    ),
  );sl.registerLazySingleton(
    () => ChangeLangUseCase(
      languageRepo: sl(),
    ),
  );
///////////////
  sl.registerLazySingleton<RandomQuoteRepository>(
    () => RandomQuoteImplRepository(
      randomQuotesRemoteData: sl(),
      randomQuotesLocalData: sl(),
      networkInfo: sl(),
    ),
  ); sl.registerLazySingleton<LanguageRepo>(
    () => LanguageRepoImpl(languageDataSourceImopl: sl(),

    ),
  );//////////////////////////

  sl.registerLazySingleton<RandomQuotesLocalData>(
    () => RandomQuotesLocalDataImpl(
      sharedPreferences: sl(),
    ),
  ); sl.registerLazySingleton<LanguageDataSource>(
    () => LanguageDataSourceImopl(
      sharedPreferences: sl(),
    ),
  );///////////////////////

  sl.registerLazySingleton<RandomQuotesRemoteData>(
    () => RandomQuotesRemoteDataImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: sl(),
    ),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(
    () => http.Client(),
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );

  sl.registerLazySingleton(
    () =>  ApiInterceptors(),
  );


}
