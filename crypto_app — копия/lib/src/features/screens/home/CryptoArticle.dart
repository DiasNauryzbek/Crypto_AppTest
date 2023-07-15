import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/src/core/resources/app_colors.dart';
import 'package:crypto_app/src/core/widgets/bold_text.dart';
import 'package:crypto_app/src/core/widgets/column_spacer.dart';
import 'package:crypto_app/src/core/widgets/row_spacer.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/hist_model.dart';
import 'package:crypto_app/src/features/screens/home/widgets/ChartSer.dart';
import 'package:crypto_app/src/features/screens/home/widgets/CryptoWrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/bloc/bloc/home_bloc.dart';

class CryptoArticle extends StatefulWidget {
  final String cryptoId;
  CryptoArticle({
    super.key,
    required this.cryptoId,
  });

  @override
  State<CryptoArticle> createState() => _CryptoArticleState();
}

class _CryptoArticleState extends State<CryptoArticle> {
  @override
  Widget build(BuildContext context) {
    final days = 1;
    return MainbarProviders(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HistoricalDataFailed) {
            return Center(child: Text(state.message));
          }
          if (state is HistoricalDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HistoricalDataSuccess) {
            List <Hist> cryptoList = state.cryptoDetail;
            
          /*  List<Result> cryptoList = state.cryptoDetail;
            Result? cryptoItem;
            for (int i = 0; i < cryptoList.length; i++) {
              if (cryptoList[i].t == widget.cryptoId) {
                cryptoItem = cryptoList[i];
                break;
              }
            }*/

            return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  toolbarHeight: 120,
                  leadingWidth: MediaQuery.of(context).size.height,
                  backgroundColor: AppColors.whiteColor,
                  leading: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 30, top: 20),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () => context.router.pop(),
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: AppColors.grey,
                                )),
                            RowSpacer(1),
                            boldText(widget.cryptoId, 26, AppColors.blackColor),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 30, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                boldText("Цена:", 14, AppColors.grey),
                                RowSpacer(2),
                 
                                boldText(cryptoList[0].c.toString(), 26,

                              //  boldText(cryptoItem?.c.toString() ?? '', 26,
                                    AppColors.blackColor)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                body: Container(
                  color: AppColors.whiteColor,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.height,
                        color: AppColors.greyLine,
                      ),
                      const ColumnSpacer(2),
                      CartSer(
                        cryptoList: cryptoList,
                        cryptoId: widget.cryptoId,
                      )
                    ],
                  ),
                ));
          }
          return Container();
        },
      ),
      cryptoId: widget.cryptoId,
      days: days,
    );
  }
}
