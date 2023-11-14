import 'package:equatable/equatable.dart';

class QuotesEinitity extends Equatable {
  final String author;
  final int id;
  final String contant;
  final String primaLink;

  QuotesEinitity({
    required this.author,
    required this.id,
    required this.contant,
    required this.primaLink,
  });
  @override
  List<Object?> get props => [
    author,
    id,
    contant,
    primaLink];
}
