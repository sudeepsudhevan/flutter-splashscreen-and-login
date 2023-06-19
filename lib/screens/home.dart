import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash/screens/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                signout(context);
              },
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: const Text('Home Screen'),
          ),
        ));
  }

  signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.pushAndRemoveUntil(ctx,
        MaterialPageRoute(builder: (ctx1) => LoginScreen()), (route) => false);
  }
}
