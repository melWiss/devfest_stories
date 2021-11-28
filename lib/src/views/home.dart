import 'package:devfest_stories/src/views/notifications.dart';
import 'package:devfest_stories/src/views/profile.dart';
import 'package:devfest_stories/src/views/stories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController(initialPage: 0);
  int index = 0;
  Color selectedItemColor(int i) {
    switch (i) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: PageView(
          controller: controller,
          onPageChanged: (value) => setState(() {
            index = value;
          }),
          children: const [
            StoriesWidget(),
            // NotificationsWidget(),
            ProfileWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setState(() {
          index = value;
          controller.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        }),
        selectedItemColor: selectedItemColor(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fireplace_outlined,
            ),
            activeIcon: Icon(
              Icons.fireplace,
            ),
            label: "Stories",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.notifications,
          //   ),
          //   activeIcon: Icon(
          //     Icons.notifications_active,
          //   ),
          //   label: "Notifications",
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            activeIcon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
