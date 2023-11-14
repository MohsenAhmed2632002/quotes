import 'package:quotes/QuotesIsRandomF/Domain/Eintitis/quotes_einitity.dart';

class QuoteModel extends QuotesEinitity {
  int id;
  String author;
  String content;
  String authorSlug;
  int length;

  QuoteModel({
    required this.id,
    required this.author,
    required this.content,
    required this.authorSlug,
    required this.length,
  }) : super(
          author: author,
          id: id,
          contant: content,
          primaLink: authorSlug,
        );

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["id"]??1,
        author: json["author"],
        content: json["content"],
        authorSlug: json["authorSlug"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "content": content,
        "authorSlug": authorSlug,
        "length": length,
      };
}
