import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image_get_started.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: whiteTextStyle.copyWith(
                    fontSize: 25,
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Explore new world with us and let\nyourself get an amazing experiences',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    height: 1.2,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  title: 'Get Started',
                  width: 220,
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  margin: EdgeInsets.only(bottom: 80),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
