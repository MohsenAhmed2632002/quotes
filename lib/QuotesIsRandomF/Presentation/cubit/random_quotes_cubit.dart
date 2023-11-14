import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Eintitis/quotes_einitity.dart';
import 'package:quotes/QuotesIsRandomF/Domain/UseCase/rendom_quotes_usecase.dart';
import 'package:quotes/core/failure.dart';

part 'random_quotes_state.dart';

class RandomQuotesCubit extends Cubit<RandomQuotesState> {
  final RandomQuotesUseCase getrandomQuotesUseCase;
  RandomQuotesCubit( {required this.getrandomQuotesUseCase})
      : super(RandomQuotesInitial());
  Future<void> getRandomQuotes() async {
    Either<Failure, QuotesEinitity> response = await getrandomQuotesUseCase.call();
    emit(response.fold(
      (Failure) => RandomQuotesErorr(mass:ServierFailuer as String),
      (QuotesEinitity) => RandomQuotesLoaded(quotesEinitity: QuotesEinitity),
    ),);
  }
}
