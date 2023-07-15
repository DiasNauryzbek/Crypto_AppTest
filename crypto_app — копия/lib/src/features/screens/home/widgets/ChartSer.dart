import 'package:crypto_app/src/core/resources/app_colors.dart';
import 'package:crypto_app/src/core/widgets/bold_text.dart';
import 'package:crypto_app/src/core/widgets/column_spacer.dart';
import 'package:crypto_app/src/core/widgets/row_spacer.dart';
import 'package:crypto_app/src/features/app/widgets/durationButton.dart';

import 'package:crypto_app/src/features/screens/home/logic/bloc/bloc/home_bloc.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/crypto_model.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/hist_model.dart';
import 'package:crypto_app/src/features/screens/home/logic/model/local/cryptoData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartSer extends StatefulWidget {
  final List<Hist> cryptoList;
  //final List<Result> cryptoList;
  final String cryptoId;

  const CartSer({
    Key? key,
    required this.cryptoList,
    required this.cryptoId,
  }) : super(key: key);

  @override
  State<CartSer> createState() => _CartSerState();
}

class _CartSerState extends State<CartSer> {
  String selectedDuration = '1Д';
   void updateSelectedDuration(String value) {
    setState(() {
      selectedDuration = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<CartCryptoDa> chartData = widget.cryptoList.map((result) {
      int duration = 1;
     
      if (selectedDuration == '1Д') {
        duration = 1;
        print(duration);
      } else if (selectedDuration == '5Д') {
        duration = 5;
        print(duration);
      } else if (selectedDuration == '1Н') {
        duration = 1;
        // set the duration value for '1Н'
      } else if (selectedDuration == '1М') {
        duration = 1;
        // set the duration value for '1М'
      } else if (selectedDuration == '3М') {
        duration = 3;
        // set the duration value for '3М'
      }


      return CartCryptoDa(
        time: duration,
        open: result.o,
        close: result.c,
        high: result.h,
        low: result.l,
      );
    }).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              SelectDuration(
                durationText: '1Д',
                selectedDuration: selectedDuration,
                updateSelectedDuration: updateSelectedDuration,
              ),
              SelectDuration(
                durationText: '5Д',
                selectedDuration: selectedDuration,
                updateSelectedDuration: updateSelectedDuration,
              ),
              SelectDuration(
                durationText: '1Н',
                selectedDuration: selectedDuration,
                updateSelectedDuration: updateSelectedDuration,
              ),
              SelectDuration(
                durationText: '1М',
                selectedDuration: selectedDuration,
                updateSelectedDuration: updateSelectedDuration,
              ),
              SelectDuration(
                durationText: '3М',
                selectedDuration: selectedDuration,
                updateSelectedDuration: updateSelectedDuration,
              ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 14,
          width: MediaQuery.of(context).size.height,
          color: AppColors.greyLine,
        ),
        if (chartData.isNotEmpty)
  SfCartesianChart(
    primaryXAxis: NumericAxis(),
    series: <ChartSeries>[
      LineSeries<CartCryptoDa, int>(
        color: AppColors.greenColor,
        dataSource: chartData,
        xValueMapper: (CartCryptoDa data, int index) => index,
        yValueMapper: (CartCryptoDa data, _) => data.close,
      ),
    ],
  ),
        Container(
          height: 14,
          width: MediaQuery.of(context).size.height,
          color: AppColors.greyLine,
        ),
        if (chartData.isNotEmpty)
          Column(
            children: [
              ColumnSpacer(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                Row(
                  children: [
                    boldText("High:", 14, AppColors.grey),
                    RowSpacer(2),

                    boldText("${chartData.last.high}", 14, AppColors.blackColor), 
                  ],
                ), 
                Row(
                  children: [
                    boldText("Open:", 14, AppColors.grey),
                    RowSpacer(2),

                    boldText("${chartData.last.open}", 14, AppColors.blackColor),
                  ],
                )
               ],
              ),
              ColumnSpacer(2), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                Row(
                  children: [
                    boldText("Close:", 14, AppColors.grey),
                    RowSpacer(2),
                    boldText("${chartData.last.close}", 14, AppColors.blackColor), 
                  ],
                ), 
                Row(
                  children: [
                    boldText("Low:", 14, AppColors.grey),
                     RowSpacer(2),
                    boldText("${chartData.last.low}", 14, AppColors.blackColor),
                  ],
                )
               ],
              ),
            
            ],
          ),
      ],
    );
  }
}


