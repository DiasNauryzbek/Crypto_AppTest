import 'package:crypto_app/src/core/resources/app_colors.dart';
import 'package:crypto_app/src/core/widgets/bold_text.dart';
import 'package:crypto_app/src/core/widgets/column_spacer.dart';
import 'package:crypto_app/src/core/widgets/row_spacer.dart';
import 'package:crypto_app/src/features/screens/home/logic/bloc/bloc/home_bloc.dart';
import 'package:crypto_app/src/features/screens/home/widgets/homeSets.dart';
import 'package:crypto_app/src/features/screens/home/widgets/searchWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoHomeWidget extends StatefulWidget {
  CryptoHomeWidget({Key? key});

  @override
  State<CryptoHomeWidget> createState() => CryptoHomeState();
}

class CryptoHomeState extends State<CryptoHomeWidget> {
  bool showTextField = false;
  String searchText = '';

  void onSearch(String value) {
    setState(() {
      searchText = value;
    });

    // Dispatch different events based on search text
    if (value.isEmpty) {
      BlocProvider.of<HomeBloc>(context).add(CryptoData());
    } else {
      BlocProvider.of<HomeBloc>(context).add(CryptoSearchDataEvent(value));
    }
  }

  void onCancel() {
    setState(() {
      showTextField = false;
      searchText = '';
    });
    // Clear search or reset the search results
    BlocProvider.of<HomeBloc>(context).add(CryptoData());
  }

  void toggleTextField() {
    setState(() {
      showTextField = !showTextField;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 120,
        leadingWidth: MediaQuery.of(context).size.height,
        backgroundColor: AppColors.whiteColor,
        leading: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (showTextField)
                    Expanded(
                      child: SearchWidget(
                        onSearch: onSearch,
                        onCancel: onCancel,
                      ),
                    ),
                  if (!showTextField)
                    const boldText("Криптовалюта", 26, AppColors.blackColor),
                  RowSpacer(1),
                  GestureDetector(
                    onTap: toggleTextField,
                    child: showTextField
                        ? boldText("Отмена", 14, AppColors.blackColor)
                        : SvgPicture.asset(
                            'assets/svg/search.svg',
                            width: 60,
                            height: 20,
                          ),
                  ),
                ],
              ),
            ),
            const ColumnSpacer(3),
            if (!showTextField)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/edit.svg'),
                        const boldText("Тикер / Название", 10, AppColors.grey),
                      ],
                    ),
                    Row(
                      children: [
                        const boldText("Цена", 10, AppColors.grey),
                        const RowSpacer(0.5),
                        SvgPicture.asset('assets/svg/rr.svg'),
                        const RowSpacer(2),
                        const boldText("Изм. % / \$", 10, AppColors.grey),
                        const RowSpacer(0.5),
                        SvgPicture.asset('assets/svg/rr.svg'),
                      ],
                    ),
                  ],
                ),
              ),
            const ColumnSpacer(2),
            const Divider(),
          ],
        ),
      ),
      body: HomeSets(),
    );
  }
}