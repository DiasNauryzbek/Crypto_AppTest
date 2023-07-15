import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/src/core/resources/app_colors.dart';
import 'package:crypto_app/src/core/widgets/bold_text.dart';
import 'package:crypto_app/src/core/widgets/row_spacer.dart';
import 'package:crypto_app/src/features/app/router/router.gr.dart';
import 'package:crypto_app/src/features/screens/home/logic/bloc/bloc/home_bloc.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/crypto_model.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSets extends StatelessWidget {
  const HomeSets({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is CryptoFail) {
            return Center(child: Text("error sets//${state.message}"));
          }
          if (state is CryptoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CryptoSuccess) {
            final crypto = state.cryptoData;
            final days = 1;
            return _buildCryptoList(crypto);
          } else if (state is CryptoSearchSuccess) {
            final searchResults =
                state.results; // Extract search results from the state
            return _buildSearchResults(searchResults);
          } else if (state is CryptoSearchError) {
            print(state.errorMessage);
          }
          return Container(
            child: Text("nullllll"),
          );
        },
      ),
    );
  }

  Widget _buildCryptoList(List<Result> crypto) {
    return Container(
      color: AppColors.whiteColor,
      child: ListView.separated(
        itemCount: crypto.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          final cryptoItem = crypto[index];
          final difference = cryptoItem.c - cryptoItem.l;
          final formattedDifference = difference.toStringAsFixed(3);

          final percentage =
              (difference / cryptoItem.l * 100).toStringAsFixed(2);

          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 10,
              bottom: 10,
            ),
            child: GestureDetector(
              onTap: () => AutoRouter.of(context).push(CryptoArticle(
                cryptoId: crypto[index].t,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boldText(
                    crypto[index].t,
                    14,
                    AppColors.blackColor,
                  ),
                  Row(
                    children: [
                      boldText(
                        crypto[index].c.toString(),
                        14,
                        AppColors.blackColor,
                      ),
                      RowSpacer(3),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: '+ ${percentage}\n ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: difference > 0
                                    ? AppColors.greenColor
                                    : AppColors.redColor,
                              ),
                            ),
                            TextSpan(
                              text: formattedDifference,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RowSpacer(4),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchResults(List<SearchModel> searchResults) {
    return Container(
      color: AppColors.whiteColor,
      child: ListView.separated(
        itemCount: searchResults.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          final searchItem = searchResults[index];
          // Build UI for search item
          // Replace the below code with your desired UI implementation
          return ListTile(
            title: Text(searchItem.name),
            subtitle: Text(searchItem.ticker),
            // Add more widgets to display other search item details
          );
        },
      ),
    );
  }
}
