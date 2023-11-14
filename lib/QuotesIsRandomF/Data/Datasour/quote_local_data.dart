import 'dart:convert';

import 'package:quotes/QuotesIsRandomF/Data/Models/Quotes_model.dart';
import 'package:quotes/core/utils/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuotesLocalData {
  Future<QuoteModel> getLastRandomQuotes();
  Future cachQuote(QuoteModel quoteModel);
}

class RandomQuotesLocalDataImpl implements RandomQuotesLocalData {
  final SharedPreferences sharedPreferences;

  RandomQuotesLocalDataImpl({required this.sharedPreferences});
  @override
  Future<QuoteModel> getLastRandomQuotes() {
    final jsonString = sharedPreferences.getString(AppStrings.cachRondomquotes);
    if (jsonString != null) {
      final cachRondomQuote = Future.value(
        QuoteModel.fromJson(
          json.decode(
            jsonString,
          ),
        ),
      );
      return cachRondomQuote;
    } else {
      return throw Exception();
    }
  }

  @override
  Future cachQuote(QuoteModel quoteModel) {
    return sharedPreferences.setString(
      AppStrings.cachRondomquotes,
      json.encode(
        quoteModel,
      ),
    );
  }
}
