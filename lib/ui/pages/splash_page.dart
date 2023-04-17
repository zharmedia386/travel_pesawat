import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_pesawat/cubit/auth_cubit.dart';
import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // changing the page after 3 seconds
    Timer(
      Duration(seconds: 3),
      () {
        // assigned the current user if there is one, otherwise it will be assigned null. The ? after User indicates that the type is nullable. It is used to check if the user is already logged in or not.
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/get-started', (route) => false);
        } else {
          print(user.email);

          // indicate that the user has been successfully authenticated
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // avoid bottom overflowed error
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_plane.png',
              width: 100,
            ),
            const SizedBox(height: 30),
            Text(
              'AIRPLANE',
              style: whiteTextStyle.copyWith(
                fontSize: 25,
                fontWeight: medium,
                letterSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
