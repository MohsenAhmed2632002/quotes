import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quotes/QuotesIsRandomF/Data/Datasour/Quote_remote_data.dart';
import 'package:quotes/QuotesIsRandomF/Data/Datasour/quote_local_data.dart';
import 'package:quotes/QuotesIsRandomF/Data/network_info.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Eintitis/quotes_einitity.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Repos/get_rendom_quote.dart';
import 'package:quotes/core/failure.dart';

class RandomQuoteImplRepository extends RandomQuoteRepository {
  late NetworkInfo networkInfo;
  late RandomQuotesLocalData randomQuotesLocalData;
  late RandomQuotesRemoteData randomQuotesRemoteData;
  RandomQuoteImplRepository(
      {required this.randomQuotesRemoteData,
      required this.randomQuotesLocalData,
      required this.networkInfo});
  @override
  Future<Either<Failure, QuotesEinitity>> getRendomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData =
            await randomQuotesRemoteData.getRandomQuotesRemoteData();
        randomQuotesLocalData.cachQuote(remoteData);
        return Right(remoteData);
      } on Exception catch (e) {
        throw Left(Text("$e"));
      }
    } else {
      try {
        final localeData = await randomQuotesLocalData.getLastRandomQuotes();
        return Right(localeData);
      } on Exception catch (e) {
        throw Left(Text("$e"));
      }
    }
  }
}
