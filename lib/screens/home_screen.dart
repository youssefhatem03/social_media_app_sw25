import 'package:flutter/material.dart';
import 'package:social_media_app_sw25/screens/dm_screen.dart';
import 'package:social_media_app_sw25/screens/main_screen.dart';
import 'package:social_media_app_sw25/screens/user_screen.dart';

List screens =[
  const DMPage(),
  const MainPage(),
  const UserPage(),
];


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            activeIndex = index;
          });
        },
        currentIndex: activeIndex,
        fixedColor: Colors.lightGreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.email_outlined), label: "الرسائل"),
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "الصفحة الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: "الصفحة الشخصية"),
        ],
      ),
      body: screens[activeIndex],
    );
  }
}
