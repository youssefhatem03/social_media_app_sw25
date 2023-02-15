import 'package:flutter/material.dart';
import 'package:social_media_app_sw25/screens/home_screen.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

final TextEditingController usernameController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey();


class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[

                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),


                // profile picture
                CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  radius: 52,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Icon(Icons.upload, size: 75, color: Colors.lightGreen,)
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),


                // username field
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "username",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        )),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),



                // finish button
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                    );

                  },
                  child: const Text("Finish",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
