import 'package:dartz/dartz.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Eintitis/quotes_einitity.dart';
import 'package:quotes/core/failure.dart';

abstract class RandomQuoteRepository {
  Future<Either<Failure, QuotesEinitity>> getRendomQuote();
}
