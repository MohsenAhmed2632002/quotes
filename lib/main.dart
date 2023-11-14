import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/QuotesIsRandomF/Presentation/cubit/language_cubit.dart';
import 'package:quotes/QuotesIsRandomF/Presentation/cubit/random_quotes_cubit.dart';
import 'package:quotes/core/Constans/Routes.dart';
import 'package:quotes/core/Constans/theme.dart';
import 'injection_container.dart' as di;
import 'config/locale/app_localizations_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<RandomQuotesCubit>(),
        ),
        // BlocProvider(
        //   create: (context) => di.sl<LanguageCubit>(),
        // ),
      ],
      child:
      //  BlocBuilder<LanguageCubit, LanguageState>(
      //   builder: (context, state) {
          // return 
          MaterialApp(
            // locale: state.locale,
            onGenerateRoute: RoutesGenerator.getRoutes,
            initialRoute: Routes.mainRoute,
            debugShowCheckedModeBanner: false,
            theme: getAppTheme(),
            // supportedLocales: AppLocalizationsSetup.supportedLocales,
            // localizationsDelegates:
            //     AppLocalizationsSetup.localizationsDelegates,
            // // localeListResolutionCallback:     AppLocalizationsSetup.,
          // );
      //   },
      ),
    );
  }
}
