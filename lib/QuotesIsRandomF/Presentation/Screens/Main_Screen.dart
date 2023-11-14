import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/QuotesIsRandomF/Domain/Eintitis/quotes_einitity.dart';
import 'package:quotes/QuotesIsRandomF/Presentation/cubit/random_quotes_cubit.dart';
import 'package:quotes/core/Constans/Colors.dart';
import 'package:quotes/core/Constans/media_query_values.dart';
import 'package:quotes/core/Constans/Font.dart';
import 'package:quotes/core/utils/app_string.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future getRandomQuotes() =>
      BlocProvider.of<RandomQuotesCubit>(context).getRandomQuotes();

  @override
  void initState() {
    super.initState();
    getRandomQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.appName,
              style: getBoldTextStyle(fontSize: 24, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<RandomQuotesCubit, RandomQuotesState>(
            builder: (context, state) {
              if (state is RandomQuotesLoaded) {
                return _TextContainer(
                  quotesEinitity: state.quotesEinitity,
                );
              } else if (state is RandomQuotesErorr) {
                return Text("${state.mass}");
              } else if (state is RandomQuotesLoading) {
                return Text(
                  " Watting.....",
                  style: getBoldTextStyle(color: ColorManager.lightGrey),
                );
              }
              return SizedBox();
            },
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ColorManager.white),
            child: IconButton(
              onPressed: () {
                getRandomQuotes();
              },
              icon: Icon(Icons.refresh),
              iconSize: 30,
              // highlightColor: ColorManager.darkPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _TextContainer extends StatelessWidget {
  final QuotesEinitity quotesEinitity;
  _TextContainer({required this.quotesEinitity});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryValues(context).mywidth,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorManager.darkGrey,
            offset: Offset(2, 5),
            blurRadius: 3,
          )
        ],
        color: ColorManager.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: Text(
        "${quotesEinitity.contant}",
        style: getMediumTextStyle(color: Colors.white ),
      ),
    );
  }
}
