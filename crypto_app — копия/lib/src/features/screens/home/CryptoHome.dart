import 'package:crypto_app/src/features/screens/home/widgets/CryptoHomeWidget.dart';
import 'package:crypto_app/src/features/screens/home/widgets/HomeWrapper.dart';

import 'package:flutter/material.dart';


class CryptoHome extends StatelessWidget {
  CryptoHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return HomeProviders(
      child: CryptoHomeWidget(),
    );
  }
}




