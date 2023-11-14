import 'package:dartz/dartz.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Eintitis/quotes_einitity.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Repos/get_rendom_quote.dart';
import 'package:quotes/core/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, QuotesEinitity>> call();
}

class RandomQuotesUseCase implements UseCase {
  final RandomQuoteRepository randomQuoteRepository;
  RandomQuotesUseCase({required this.randomQuoteRepository});

  @override
  Future<Either<Failure, QuotesEinitity>> call( ) =>
      randomQuoteRepository.getRendomQuote();
}
