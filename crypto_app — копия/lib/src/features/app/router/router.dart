import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/src/features/screens/home/CryptoArticle.dart';
import 'package:crypto_app/src/features/screens/home/CryptoHome.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(page: CryptoHome,path: '/', initial: true),
      AutoRoute(page: CryptoArticle,path: '/article'),

    






   



    
    ],
)
class $AppRouter {}