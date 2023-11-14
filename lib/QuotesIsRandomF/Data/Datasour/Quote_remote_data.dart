import 'dart:convert';

import 'package:quotes/QuotesIsRandomF/Data/Models/Quotes_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/api/end_point.dart';

abstract class RandomQuotesRemoteData {
  Future<QuoteModel> getRandomQuotesRemoteData();
}

class RandomQuotesRemoteDataImpl implements RandomQuotesRemoteData {
  http.Client client;
  RandomQuotesRemoteDataImpl({required this.client});
  @override
  Future<QuoteModel> getRandomQuotesRemoteData() async {
    final url = Uri.parse(EndPoint.baseUrl_rondom);
    final respo =
        await client.get(url, headers: {"content-type": "application/json"});
    if (respo.statusCode == 200) {
      return QuoteModel.fromJson(
        json.decode(respo.body),
      );
    } else {
      throw Exception();
    }
  }
}
