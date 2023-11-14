part of 'random_quotes_cubit.dart';

sealed class RandomQuotesState extends Equatable {
  const RandomQuotesState();

  @override
  List<Object> get props => [];
}

final class RandomQuotesInitial extends RandomQuotesState {}

final class RandomQuotesLoading extends RandomQuotesState {}

final class RandomQuotesErorr extends RandomQuotesState {
  final String mass;

  RandomQuotesErorr({required this.mass});
  
  @override
  List<Object> get props => [mass];
}

final class RandomQuotesLoaded extends RandomQuotesState {
  final QuotesEinitity quotesEinitity;

  RandomQuotesLoaded({required this.quotesEinitity});

  @override
  List<Object> get props => [quotesEinitity];
}
