import 'package:devfest_stories/src/views/about.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.help),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const AboutScreen();
                  },
                ));
              },
            ),
            Divider(
              height: 0,
            ),
            ListTile(
              title: Text("Log out"),
              leading: Icon(Icons.logout),
              onTap: () {},
            ),
            Divider(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
