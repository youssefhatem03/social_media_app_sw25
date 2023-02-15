import 'package:flutter/material.dart';

class DMPage extends StatefulWidget {
  const DMPage({Key? key}) : super(key: key);

  @override
  State<DMPage> createState() => _DMPageState();
}

class _DMPageState extends State<DMPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("You have no friends"),
      ),
    );
  }
}
