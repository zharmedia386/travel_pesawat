import 'package:travel_pesawat/cubit/auth_cubit.dart';
import 'package:travel_pesawat/cubit/destination_cubit.dart';
import 'package:travel_pesawat/cubit/page_cubit.dart';
import 'package:travel_pesawat/cubit/seat_cubit.dart';
import 'package:travel_pesawat/cubit/transaction_cubit.dart';
// import 'package:travel_pesawat/cubit/seat_cubit.dart';
// import 'package:travel_pesawat/cubit/transaction_cubit.dart';
import 'package:travel_pesawat/ui/pages/bonus_page.dart';
import 'package:travel_pesawat/ui/pages/get_started_page.dart';
import 'package:travel_pesawat/ui/pages/main_page.dart';
import 'package:travel_pesawat/ui/pages/sign_in_page.dart';
import 'package:travel_pesawat/ui/pages/sign_up_page.dart';
import 'package:travel_pesawat/ui/pages/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // a list of BlocProvider widgets
    return MultiBlocProvider(
      providers: [
        // responsible for creating an instance of a specific Bloc and providing it to its child widgets.
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/success': (context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}
