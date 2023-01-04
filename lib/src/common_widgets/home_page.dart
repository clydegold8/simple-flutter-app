import 'package:flutter/material.dart';
import '../../src/constants/routes.dart';
import '../constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBlockColors.homePageBackGroundColor,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            const Text('TODO: Home Page'),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.whitelistRoute);
                },
                child: const Text('Whitelist Page ->'),
              ),
            )
          ])),
    );
  }
}
