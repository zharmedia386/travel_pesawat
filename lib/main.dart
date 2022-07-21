import 'package:flutter/material.dart';
import 'package:travel_pesawat/ui/pages/sign_up_page.dart';

import 'ui/pages/splash_page.dart';
import 'ui/pages/get_started.dart';
import 'ui/pages/bonus_page.dart';
import 'ui/pages/main_page.dart';

void main() => runApp(const TravelPesawat());

class TravelPesawat extends StatelessWidget {
  const TravelPesawat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/get-started': (context) => GetStartedPage(),
        '/sign-up': (context) => SignUpPage(),
        '/bonus': (context) => BonusPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}
