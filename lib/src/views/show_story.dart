import 'package:flutter/material.dart';

class ShowStoryScreen extends StatelessWidget {
  const ShowStoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 175,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                "Sign in with Google",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
